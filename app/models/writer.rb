class Writer < ActiveRecord::Base
  has_many :stories
  has_many :writer_goals
  has_many :goals, through: :writer_goals
  has_many :activities
end
