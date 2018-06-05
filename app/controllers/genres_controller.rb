class GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def show
    @genre = Genre.find(params[:id])
    @movies = GenreMovie.where(genre_id: @genre.id)
    #@movie = Movie.find(params[:movie_id])
    #binding.pry
  end

  def create
    @genre = Genre.create(genre_params)
    if @genre.save
      redirect_to genres_path
    else
      render :new
    end
  end

  private
    def genre_params
      params.require(:genre).permit(:name)
    end

    def require_admin
     render file: "/public/404" unless current_admin?
    end

end
