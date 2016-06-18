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
	email: 'tina@gmail.com',
	password: 'testpage',
	admin: false,
  state: 'Profile complete'
  )

writer1 = Writer.find_or_initialize_by(user_id: user1.id)
writer1.update!(
  full_name: 'Tina Talksalot',
  twitter: '@bla_bla',
  location: 'Reno',
  bio: 'Started creating stories before I could write. I love writing about real life events, bringing animation through words to the imagination.'
  )

story1 = Story.create!(
   writer_id: writer1.id,
   title: "The Case of The Lower Case Letter",
   summary: "The famous lexical semanticist Professor Edgar Nettleston had been found dead, a gunshot wound to the head.",
   body: "She breezed into my office one cold September morning. I had been enjoying a hot cup of Starbuck's finest and surfing the web for local news. The famous lexical semanticist Professor Edgar Nettleston had been found dead, a gunshot wound to the head. The police verdict was suicide.
     She held out an elegant hand as she floated towards me and I glimpsed a wedding band with a stone the size of a peanut M&M.",
  published: true
  )

# Writer 2
user2 = User.create!(
	email: 'suzy@gmail.com',
	password: 'testpage',
	admin: false,
  state: 'Profile complete'
  )

writer2 = Writer.find_or_initialize_by(user_id: user2.id)
writer2.update!(
  full_name: 'Suzy SeeMe',
  twitter: '@lookatme',
  location: 'Reno',
  bio: 'Childrens stories are my thing. Fostering the imagination or kids, teaching for a greater future.'
  )

story2 = Story.create!(
   writer_id: writer2.id,
   title: "A dog named Roo",
   summary: "Roo, an excitable, friendly, squeaky toy hogging dog.",
   body: "She blasted through the screen door without a care in the world. The only thing on her mind was the big red ball that she was sure she heard calling her name, ’Roo, Roo.’ She jumped across from the deck to the lawn, completely missing the walkway, pouncing on the ball as it let out a terrified squeak.",
  published: true
  )

# Writer 3
user3 =User.create!(
  email: 'mary@gmail.com',
  password: 'testpage',
  admin: false,
  state: 'Profile complete'
  )

writer3 = Writer.find_or_initialize_by(user_id: user3.id)
writer3.update!(
  full_name: 'Mary Maybe',
  twitter: '@notU',
  location: 'Sparks',
  bio: 'Started writing mystery ghost stories and real life mysteries when my house-spirit seemed to be asking for help.'
  )

story3 = Story.create!(
   writer_id: writer3.id,
   title: "The girl in the hallway.",
   summary: "The story about a little girl lost in time, trapped in another world.",
   body: "Her name was Sarah when she lived in the 1800’s, on a little farm where this subdivision now stands.",
  published: true
  )
