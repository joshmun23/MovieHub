class AddColumnVotes < ActiveRecord::Migration
  def up
    add_column :reviews, :votes, :integer, default: 0
  end
  def down
    remove_column :reviews, :votes
  end
end
