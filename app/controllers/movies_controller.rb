class MoviesController < ApplicationController
  before_action :find_movie, only: [:edit, :update, :show]

  def index
    @movies = Movie.order(:title).page params[:page]
  end

  def show
    @review = Review.new
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

  protected

  def movie_params
    params.require(:movie).permit(:title, :year)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
