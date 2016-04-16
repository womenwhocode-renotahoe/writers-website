class AddDateTime < ActiveRecord::Migration
  def change
    change_table :stories do |t|
  	t.datetime :date_time_published
  	t.boolean :published, default:false, null:false
 	end	
  end
end
