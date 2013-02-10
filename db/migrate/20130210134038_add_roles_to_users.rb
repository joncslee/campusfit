class AddRolesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    add_column :users, :moderator, :boolean
    add_column :users, :member, :boolean, :default => 1
  end
end
