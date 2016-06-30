class ChangeFreqToInteger < ActiveRecord::Migration
  def change
  	change_column :goals, :freq, 'integer USING CAST(freq AS integer)'
  end
end

