class CreateExpandedGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :writer_id, null: false
      t.string :title, null: false
      t.string :verb, null: false
      t.integer :count, default: 1, null: false
      t.string :noun, null: false
      t.string :freq
      t.integer :current_count
      t.datetime :by_date
      t.boolean :achieved, default: false, null: false

      t.timestamps null: false
    end
    add_index :goals, :writer_id
  end
end
