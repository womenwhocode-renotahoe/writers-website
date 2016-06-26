class Writer < ActiveRecord::Base
  after_create :set_initial_goals

  has_many :stories
  has_many :goals
  has_many :activities
  belongs_to :user

  private

  def set_initial_goals
    goal1 = Goal.create!(
      writer_id: self.id,
      title: 'Creative Goal',
      verb: 'write',
      count: 2000,
      noun: 'words',
      freq: 'daily',
      by_date: Date.tomorrow.end_of_day)

    goal2 = Goal.create!(
      writer_id: self.id,
      title: 'Sharing Goal',
      verb: 'blog',
      count: 1,
      noun: 'post',
      freq: 'weekly',
      by_date: Date.current+6)

    goal3 = Goal.create!(
      writer_id: self.id,
      title: 'Develop Goal',
      verb: 'study',
      count: 3,
      noun: 'hours',
      freq: 'weekly',
      by_date: Date.current+6)

    goal4 = Goal.create!(
      writer_id: self.id,
      title: 'Publish Goal',
      verb: 'edit',
      count: 1,
      noun: 'hours',
      freq: 'daily',
      by_date: Date.tomorrow.end_of_day)
  end

end
