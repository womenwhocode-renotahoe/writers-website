class CreateWriterGoals < ActiveRecord::Migration
  def change
    create_table :writer_goals do |t|
      t.integer :writer_id, null: false
      t.integer :goal_id, null: false
      t.decimal :value, null: false

      t.timestamps null: false
    end
    add_index :writer_goals, :writer_id
    add_index :writer_goals, :goal_id
  end
end
