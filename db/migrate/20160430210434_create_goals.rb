class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :activity_type, null: false
      t.string :unit, null: false
      t.boolean :visible, null: false

      t.timestamps null: false
    end
  end
end
