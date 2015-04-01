class ReviewsController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @review = Review.new(review_params)
    @review.movie = @movie
    @review.user = current_user

    if @review.save
      flash[:notice] = 'Review Successfully Created'
      redirect_to movie_path(@movie)
    else
      @review.errors.full_messages.each { |message| flash[:errors] = message }
      render 'movies/show'
    end
  end

  def update
    @review = Review.find(params[:id])
    @movie = Movie.find(params[:movie_id])

    if @review.update(review_params)
      flash[:notice] = 'Review edited'
      redirect_to movie_path(@movie)
    else
      @review.errors.full_messages.each { |message| flash[:errors] = message }
      render 'movies/show'
    end
  end

  def destroy
    Review.delete(params[:id])
    flash[:notice] = 'Review deleted'
    @movie = Movie.find(params[:movie_id])

    redirect_to movie_path(@movie)
  end

  private

  def review_params
    params.require(:review).permit(:body)
  end
end
