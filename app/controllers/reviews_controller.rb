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
      binding.pry
      render 'movies/show'
    end
  end

  def update
    @review = review.find(params[:id])
    @review.user_id = current_user.id

    if @review.update(review_params)
      flash[:notice] = 'review Revised'

      redirect_to review_path(@review)
    else
      flash[:alert] = 'review Not Revised'
      render :edit

      redirect_to edit_review_path(@review)
    end
  end

  def destroy
    review.delete(params[:id])
    redirect_to movie_path(@movie)
  end

  private

  def review_params
    params.require(:review).permit(:body)
  end
end
