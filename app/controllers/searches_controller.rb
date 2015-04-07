class SearchesController < ApplicationController
  def index
    @movies = Movie.where("title iLIKE '%#{params[:search_title]}%'")

    flash[:notice] = "No movie matches found" if @movies.empty?

    flash[:notice] = "Please enter a search term" if params[:search_title].empty?

    render 'movies/index'
  end
end
