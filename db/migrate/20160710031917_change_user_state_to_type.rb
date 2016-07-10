class ChangeUserStateToType < ActiveRecord::Migration
  def up
  	remove_column :users, :state
  	remove_column :users, :admin
  	add_column :users, :role, :string, default: 'visitor', null: false
  end
  def down
  	add_column :users, :state, :string
  	add_column :users, :admin, :boolean, null: false, default: false
  	remove_column :users, :role
  end
end
