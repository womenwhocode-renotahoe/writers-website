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

# Writer 1
user1 = User.create!(
	email: 'user_1@new2me.com',
	password: 'testpage',
	admin: false)

writer1 = Writer.find_or_initialize_by(user_id: user1.id)
writer1.update!(
  full_name: 'Tina Talksalot',
  twitter: '@bla_bla',
  location: 'Reno',
  bio: 'Started creating stories before I could write. I love writing about real life events, bringing animation trhough words to the imagination.'
  )

# Writer 2
user2 = User.create!(
	email: 'me_me@allaboutme.com',
	password: 'testpage',
	admin: false)

writer2 = Writer.find_or_initialize_by(user_id: user2.id)
writer2.update!(
  full_name: 'Suzy SeeMe',
  twitter: '@lookatme',
  location: 'Reno',
  bio: 'Childrens stories are my thing. Fostering the imagination or kids, teaching for a greater future.'
  )

# Writer 3
user3 =User.create!(
  email: 'fingers_crossed@HopeThisWorks.com',
  password: 'testpage',
  admin: false)

writer3 = Writer.find_or_initialize_by(user_id: user3.id)
writer3.update!(
  full_name: 'Mary Maybe',
  twitter: '@notU',
  location: 'Sparks',
  bio: 'Started writing mystery ghost stories and real life mysteries when my house-spirit seemed to be asking for help.'
  )

