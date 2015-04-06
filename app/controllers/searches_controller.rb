class SearchesController < ApplicationController
  def index
    @movies = Movie.where("title iLIKE '%#{params[:title]}%'")

    render 'movies/index'
  end
end
