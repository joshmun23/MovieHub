class AutocompleteController < ApplicationController
  def index
    movies = Omdb::Api.new.search(params[:q])
    json_movies = JSON.parse(movies[:movies].to_json).map { |m| m["title"] }
    respond_to do |format|
      format.js { render json: json_movies }
    end
  end
end
