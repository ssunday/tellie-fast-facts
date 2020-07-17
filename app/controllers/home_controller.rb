class HomeController < ApplicationController
  def index
    render plain: 'Fast Facts'
  end
end
