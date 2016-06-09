class Activity < ActiveRecord::Base
  belongs_to :writer_goal
  belongs_to :writer
end
