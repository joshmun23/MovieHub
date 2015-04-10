class AddColumnsToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :poster, :string
    add_column :movies, :genre, :string
    add_column :movies, :director, :string
    add_column :movies, :actors, :string
    add_column :movies, :runtime, :string
    add_column :movies, :rated, :string
    add_column :movies, :plot, :string
    add_column :movies, :imdb_id, :string
    change_column :movies, :year, :string, null: true
  end
end
