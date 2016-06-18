class Story < ActiveRecord::Base
  belongs_to :writer
  scope :published, -> {
  	where(published: true)
  }
  scope :latest, -> {
    order('updated_at DESC').limit(1)
  }
end
