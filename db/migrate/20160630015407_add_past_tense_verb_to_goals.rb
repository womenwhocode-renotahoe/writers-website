class AddPastTenseVerbToGoals < ActiveRecord::Migration
  def change
  	change_table :goals do |t|
      t.string :verb_past_tense
    end
  end
end
