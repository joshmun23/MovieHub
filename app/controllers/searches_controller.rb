class SearchesController < ApplicationController
  def index
    @movies = Movie.where("title iLIKE '%#{params[:search_title]}%'").page params[:page]

    flash[:notice] = "No movie matches found" if @movies.empty?

    flash[:notice] = "Enter a search term" if params[:search_title].empty?

    render 'movies/index'
  end
end
