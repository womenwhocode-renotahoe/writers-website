class AddWriterIdToActivities < ActiveRecord::Migration
  def change
    change_table :activities do |t|
      t.integer :writer_id, null: false
    end
    add_index :activities, :writer_id
  end
end
