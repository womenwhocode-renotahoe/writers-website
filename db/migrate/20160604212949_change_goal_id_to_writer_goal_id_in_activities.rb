class ChangeGoalIdToWriterGoalIdInActivities < ActiveRecord::Migration
  def change
  	rename_column :activities, :goal_id, :writer_goal_id
  end
end
