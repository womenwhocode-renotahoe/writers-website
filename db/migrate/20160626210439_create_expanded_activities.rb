class CreateExpandedActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :writer_id, null: false
      t.integer :goal_id, null: false
      t.integer :count, null: false
      t.datetime :date

      t.timestamps null: false
    end
    add_index :activities, :writer_id
    add_index :activities, :goal_id
  end
end
