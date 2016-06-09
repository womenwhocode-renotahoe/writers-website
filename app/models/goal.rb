class Goal < ActiveRecord::Base
  has_many :writer_goals
  has_many :writers, through: :writer_goals
end
