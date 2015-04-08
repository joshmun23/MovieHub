class AutocompleteController < ApplicationController
  def index
    @movies = Omdb::Api.new.search(params[:q])

    JSON.parse(@movies[:movies].to_json).map{ |m| m['title'] }
  end
end
