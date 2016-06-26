class DropGoals < ActiveRecord::Migration
  def up
  	drop_table :goals
  end

  def down
    create_table :goals do |t|
      t.string :activity_type, null: false
      t.string :unit, null: false
      t.boolean :visible, null: false

      t.timestamps null: false
    end
  end
end
