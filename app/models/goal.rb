class Goal < ActiveRecord::Base
  belongs_to :writer
  has_many :activities
end
