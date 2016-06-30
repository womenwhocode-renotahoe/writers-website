class DropActivitiesTable < ActiveRecord::Migration
  def up
  	drop_table :activities
  end
  def down
  	create_table :activities do |t|
      t.date :date, null: false
      t.integer :goal_id, null: false
      t.text :description, null: false
      t.integer :value, null: false

      t.timestamps null: false
    end
    add_index :activities, :goal_id
  end
end
