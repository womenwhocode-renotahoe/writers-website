class CreateWriters < ActiveRecord::Migration
  def change
    create_table :writers do |t|
      t.string :twitter
      t.string :full_name
      t.text :bio
      t.string :location
      t.date :birthdate
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :writers, :user_id
  end
end
