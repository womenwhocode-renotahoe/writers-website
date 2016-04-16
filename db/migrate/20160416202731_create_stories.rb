class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.integer :writer_id, null: false
      t.string :title, null: false
      t.string :summary, null: false
      t.text :body, null: false

      t.timestamps null: false
    end
  end
end
