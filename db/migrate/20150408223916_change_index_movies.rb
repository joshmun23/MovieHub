class ChangeIndexMovies < ActiveRecord::Migration
  def change
    remove_index :movies, column:[:title, :year]
    add_index :movies, [:title, :user_id], unique: true
  end
end
