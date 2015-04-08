class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]

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

    if params[:votes]
      votes
      @review.save
      render 'movies/show' unless @js_error_display
    else
      if @review.update(review_params)
        redirect_to movie_path(@movie)
      else
        @review.errors.full_messages.each { |message| flash[:errors] = message }
        render 'movies/show'
      end
    end
  end

  def destroy
    Review.delete(params[:id])
    flash[:notice] = 'Review deleted'
    @movie = Movie.find(params[:movie_id])

    redirect_to movie_path(@movie)
  end

  def votes
    @review.votes = params[:votes]
    @vote = UserVote.new(review: @review, user: current_user,
                         vote_type: params[:vote_type])
    current_vote = UserVote.find_by(review: @review, user: current_user)
    if current_vote && current_vote.vote_type != @vote.vote_type
      UserVote.delete(current_vote)
    else
      unless @vote.save
        respond_to do |format|
          @js_error_display = true
          format.js { render 'movies/show', status: 403 }
        end
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:body)
  end
end
