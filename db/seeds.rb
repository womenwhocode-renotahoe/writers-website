# define base admin user
admin_user = User.create!(
	email: 'admin@womenwhocoderenotahoe.com',
	password: 'Hermione',
	admin: true)

# define basic goals
goal_writing1 = Goal.create!(
	activity_type: 'Word Count',
	unit: 'Count',
	visible: true)

goal_writing2 = Goal.create!(
	activity_type: 'Writing Frequency',
	unit: 'Days',
	visible: true)

goal_posts = Goal.create!(
	activity_type: 'Blogging',
	unit: 'Count',
	visible: true)

