class HomeController < ApplicationController
  def index
    @suggested_episodes = Episode.order(Arel.sql('RANDOM()')).take(5)
  end
end
