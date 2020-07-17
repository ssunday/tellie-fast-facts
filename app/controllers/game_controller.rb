class GameController < ApplicationController
  def show
    @episode = find_episode
  end

  def update
    @episode = find_episode

    @answers = params[:statement_ids] || []

    @correct_answers = @episode
                       .episode_statements
                       .where(correct: true, id: params[:statement_ids])
                       .or(
                         @episode
                           .episode_statements
                           .where(correct: false)
                           .where.not(id: params[:statement_ids])
                       )
                       .count

    render :results
  end

  def leaderboard
    @episode = find_episode

    game_score = @episode
                 .game_scores
                 .find_or_create_by(username: params[:username])

    game_score.update!(score: game_score.score + params.fetch(:correct_answers, 0).to_i)

    @episode.reload

    render :results
  end

  private

  def find_episode
    Episode.includes(:episode_statements).find(params[:id])
  end
end
