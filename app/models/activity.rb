class Activity < ActiveRecord::Base
  belongs_to :writer
  belongs_to :goal
  after_save :update_goal
  scope :latest, -> {
    order('updated_at DESC').limit(4)
  }

  def update_goal
  	goal = Goal.find(self.goal_id)
  	goal.current_count += self.count
  	if goal.current_count >= goal.count
  		goal.achieved = true
  		goal.current_count = 0
  		goal.by_date = goal.freq.days.from_now.end_of_day
  	end
    goal.save
  end
end
