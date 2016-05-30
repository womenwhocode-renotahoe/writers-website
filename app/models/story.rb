class Story < ActiveRecord::Base
  belongs_to :writer
  scope :published, -> {
  	where(published: true)
  }
end
