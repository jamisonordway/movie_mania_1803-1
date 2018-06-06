class AwardsController < ApplicationController

  def index
    @awards = Award.all
  end

  def show
    @award = Award.find(params[:id])
    @movie_awards = @award.movies
  end
end
