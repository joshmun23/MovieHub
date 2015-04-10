class SearchesController < ApplicationController
  def index
    movies = Movie.where("title iLIKE '%#{params[:q]}%'")

    json_movies = JSON.parse(movies.to_json).map { |m| m["title"] }
    respond_to do |format|
      format.js { render json: json_movies }
    end
  end

  def show_movie
    movie = Movie.find_by(title: params[:search_title])
    if movie
      redirect_to movie_path(movie)
    else
      flash[:alert] = "No movie matches found"
      redirect_to movies_path
    end
  end
end
