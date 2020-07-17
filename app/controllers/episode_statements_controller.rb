class EpisodeStatementsController < ApplicationController
  def new
    @episode = find_episode
    @episode_statement = EpisodeStatement.new(episode_id: params[:episode_id])
  end

  def edit
    @episode = find_episode
    @episode_statement = find_episode_statement
  end

  def create
    @episode = find_episode
    @episode_statement = @episode.episode_statements.build(episode_statement_params)

    if @episode_statement.save
      redirect_to episode_url(@episode), notice: 'Statement was successfully created.'
    else
      render :new
    end
  end

  def update
    @episode = find_episode
    @episode_statement = find_episode_statement
    if @episode_statement.update(episode_statement_params)
      redirect_to episode_url(@episode), notice: 'Statement was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    find_episode_statement.destroy

    redirect_to episode_url(find_episode), notice: 'Statement was successfully destroyed.'
  end

  private

  def find_episode
    Episode.find(params[:episode_id])
  end

  def find_episode_statement
    EpisodeStatement.find_by(episode_id: params[:episode_id], id: params[:id])
  end

  def episode_statement_params
    params.require(:episode_statement).permit(:statement, :correct)
  end
end
