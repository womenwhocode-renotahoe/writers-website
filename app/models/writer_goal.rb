class WriterGoal < ActiveRecord::Base
  belongs_to :writer
  belongs_to :goal
end
