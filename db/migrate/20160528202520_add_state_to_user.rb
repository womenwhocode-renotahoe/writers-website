class AddStateToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :state, null: false, default: "No actions taken"
    end
  end
end
