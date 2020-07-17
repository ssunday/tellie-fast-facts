class GameController < ApplicationController
  def show
    @episode = find_episode
  end

  def update
    episode = find_episode

    correct = episode.episode_statements.find_by(correct: true, id: params[:statement_id]).present?

    redirect_to game_path(episode), notice: "You are #{correct ? 'correct' : 'incorrect'}!"
  end

  private

  def find_episode
    Episode.includes(:episode_statements).find(params[:id])
  end
end
