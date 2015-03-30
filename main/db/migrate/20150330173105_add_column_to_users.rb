class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_name, :string, null: false
    add_column :users, :admin, :boolean, null: false
  end
end
