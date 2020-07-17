class GameController < ApplicationController
  def show
    @episode = find_episode
  end

  def update
    @episode = find_episode

    @correct = @episode.episode_statements.find_by(correct: true, id: params[:statement_id]).present?

    render :results
  end

  def leaderboard
    @episode = find_episode

    game_score = @episode
                 .game_scores
                 .find_or_create_by(username: params[:username])

    game_score.update!(score: game_score.score + 1)

    @episode.reload

    render :results
  end

  private

  def find_episode
    Episode.includes(:episode_statements).find(params[:id])
  end
end
