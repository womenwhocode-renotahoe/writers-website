class SetDefaultOnGoalCurrentCount < ActiveRecord::Migration
  def change
  	change_column :goals, :current_count, :integer, default: 0, null: false
  end
end
