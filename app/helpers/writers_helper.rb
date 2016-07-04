module WritersHelper
	def progress(goal)
		how_long = distance_of_time_in_words(goal.by_date, Time.now)
		remaining = goal.count - goal.current_count
		if goal.noun == "hour"
			"#{goal.verb} #{remaining} #{goal.noun.pluralize(remaining)} before #{goal.by_date.strftime("%A")}"
		else
		  "#{remaining} #{goal.noun.pluralize(remaining)} due in #{how_long}"
		end
	end

	def achievement(activity)
		goal = Goal.find(activity.goal_id)
		done_when = custom_format(activity.date)
		"#{done_when}, you #{activity.goal.verb_past_tense} #{number_with_delimiter(activity.count)} #{activity.goal.noun.pluralize(activity.count)}"
	end

	def custom_format(date_and_time)
	  date = date_and_time.to_date
	  if date == DateTime.now.to_date
	    "Today"
	  elsif date == DateTime.yesterday
	    "Yesterday"
	  elsif (date > DateTime.now - 7) && (date < DateTime.yesterday)
	    date.strftime("%A")
	  else
	    date.strftime("%B %-d")
	  end
	end
end