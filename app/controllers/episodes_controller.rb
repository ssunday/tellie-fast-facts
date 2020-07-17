class EpisodesController < ApplicationController
  def index
    @episodes = Episode.all
  end

  def show
    @episode = find_episode(include_statements: true)
  end

  def new
    @episode = Episode.new
  end

  def edit
    @episode = find_episode
  end

  def create
    @episode = Episode.new(episode_params)

    if @episode.save
      redirect_to @episode, notice: 'Episode was successfully created.'
    else
      render :new
    end
  end

  def update
    @episode = find_episode
    if @episode.update(episode_params)
      redirect_to @episode, notice: 'Episode was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    find_episode.destroy
    redirect_to episodes_url, notice: 'Episode was successfully destroyed.'
  end

  private

  def find_episode(include_statements: false)
    (include_statements ? Episode.includes(:episode_statements) : Episode).find(params[:id])
  end

  def episode_params
    params.require(:episode).permit(:name)
  end
end
