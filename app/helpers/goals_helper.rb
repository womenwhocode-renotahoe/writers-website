module GoalsHelper
	def goal_freq(goal)
		goal_days = goal.freq + 1
		if goal_days == 1
			return "- every day"
		else
			goal_days < 8 
			return "- every #{goal_days} days"
		end
	end
end
