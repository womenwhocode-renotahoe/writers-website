module WritersHelper
	def progress(goal)
		how_long = distance_of_time_in_words(goal.by_date, Time.now)
		if goal.noun == "hour"
			"#{goal.verb} #{goal.count} #{goal.noun.pluralize(goal.count)} before #{goal.by_date.strftime("%A")}"
		else
		  "#{goal.count} #{goal.noun.pluralize(goal.count)} due in #{how_long}"
		end
	end
end