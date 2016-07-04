class Writer < ActiveRecord::Base
  after_create :set_initial_goals

  has_many :stories
  has_many :goals
  has_many :activities
  belongs_to :user

  scope :latest, -> {
    order('updated_at DESC').limit(3)
  }

  private

  def set_initial_goals
    goal1 = Goal.create!(
      writer_id: self.id,
      title: 'Creative Goal',
      verb: 'write',
      verb_past_tense: 'wrote',
      count: 2000,
      noun: 'word',
      freq: 0,
      current_count: 0,
      by_date: 0.days.from_now.end_of_day)

    goal2 = Goal.create!(
      writer_id: self.id,
      title: 'Sharing Goal',
      verb: 'blog',
      verb_past_tense: 'blogged',
      count: 1,
      noun: 'post',
      freq: 6,
      current_count: 0,
      by_date: 6.days.from_now.end_of_day)

    goal3 = Goal.create!(
      writer_id: self.id,
      title: 'Develop Goal',
      verb: 'study',
      verb_past_tense: 'studied',
      count: 3,
      noun: 'hour',
      freq: 3,
      current_count: 0,
      by_date: 3.days.from_now.end_of_day)

    goal4 = Goal.create!(
      writer_id: self.id,
      title: 'Publish Goal',
      verb: 'edit',
      verb_past_tense: 'edited',
      count: 1,
      noun: 'hour',
      freq: 30,
      current_count: 0,
      by_date: 30.days.from_now.end_of_day)
  end

end
