module WritersHelper
	def progress(goal)
		how_long = distance_of_time_in_words(goal.by_date, Time.now)
		if goal.noun == "hours"
			"#{goal.verb} #{goal.count} hours before #{goal.by_date.strftime("%A")}"
		else
		  "#{goal.count} #{goal.noun} due in #{how_long}"
		end
	end
end