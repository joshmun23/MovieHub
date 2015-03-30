class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.string :year, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
    add_index :movies, [:title, :year], unique: true
  end
end
