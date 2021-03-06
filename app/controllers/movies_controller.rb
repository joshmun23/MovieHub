class MoviesController < ApplicationController
  before_action :find_movie, only: [:edit, :update, :show]

  def index
    @movies = Movie.order(:title)
    @trending_movies = MovieHelper.new(@movies).find_movies
    @genres = MovieHelper.new(@movies).genre_splitter
  end

  def show
    @movie = Movie.find(params[:id])
    @review = Review.new

    render :show
  end

  def new
    @movie = Movie.new
  end

  def edit
  end

  def create
    omdb_movie = Omdb::Api.new.fetch(movie_params[:title])
    @movie = Movie.new(movie_params)
    @movie.user = current_user
    get_movie

    if @movie.save
      flash[:notice] = 'Movie Successfully Created'
      redirect_to movies_path
    else
      flash[:errors] = @movie.errors.full_messages.join(' ')
      render :new
    end
  end



  def update
    @movie.user = current_user

    if @movie.update(movie_params)
      flash[:notice] = 'Movie Revised'
      redirect_to movie_path(@movie)
    else
      flash[:alert] = @movie.errors.full_messages

      render :edit
    end
  end

  def destroy
    Movie.find(params[:id]).destroy
    redirect_to movies_path
  end

  def get_movie
    omdb_movie = Omdb::Api.new.fetch(movie_params[:title])
    @movie.year = omdb_movie[:movie].year
    @movie.poster = omdb_movie[:movie].poster ? omdb_movie[:movie].poster : ''
    @movie.genre = omdb_movie[:movie].genre
    @movie.director = omdb_movie[:movie].director
    @movie.actors = omdb_movie[:movie].actors
    @movie.runtime = omdb_movie[:movie].runtime
    @movie.rated = omdb_movie[:movie].rated
    @movie.plot = omdb_movie[:movie].plot
    @movie.imdb_id = omdb_movie[:movie].imdb_id
  end


  protected

  def movie_params
    params.require(:movie).permit(:title)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end
end
