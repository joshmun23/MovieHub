class CreateUserVotes < ActiveRecord::Migration
  def change
    create_table :user_votes do |t|
      t.integer :user_id, null: false
      t.integer :review_id, null: false
      t.string :vote_type, null: false

      t.timestamps null: false
    end
    add_index :user_votes, [:user_id, :review_id, :vote_type], unique: true
  end
end
