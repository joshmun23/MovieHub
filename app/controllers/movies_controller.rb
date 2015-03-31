class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user_id = current_user.id

    if @movie.save
      flash[:notice] = 'Movie Successfully Created'
      redirect_to '/movies'
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update(movie_params)
      flash[:notice] = 'Movie Revised'
      redirect_to movie_path
    else
      flash[:alert] = 'Movie Not Revised'
      render :edit
    end
  end

  def destroy
    Movie.find(params[:id]).destroy
    redirect_to movie_path
  end


  private

  def movie_params
    params.require(:movie).permit(:title, :year)
  end
end
