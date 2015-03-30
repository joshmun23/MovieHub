class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
  end

  def new
    # @user = User.find(params[:id])
    @movie = Movie.new
  end

  def edit
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
  end

  def destroy
  end


  private

  def movie_params
    params.require(:movie).permit(:title, :year)
  end
end
