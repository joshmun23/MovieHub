class MoviesController < ApplicationController
  before_action :find_movie, only: [:edit, :update, :show]

  def index
    @movies = Movie.all.limit(10)
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user = current_user

    if @movie.save
      flash[:notice] = 'Movie Successfully Created'
      redirect_to movies_path
    else
      render :new
    end
  end

  def update
    @movie.user = current_user

    if @movie.update(movie_params)
      flash[:notice] = 'Movie Revised'

      redirect_to movie_path(@movie)
    else
      flash[:alert] = @movie.errors.full_messages #'Movie Not Revised' 
      render :edit
      # redirect_to edit_movie_path(@movie)
    end
  end

  def destroy
    Movie.find(params[:id]).destroy

    redirect_to movies_path
  end


  protected

  def movie_params
    params.require(:movie).permit(:title, :year)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end
end
