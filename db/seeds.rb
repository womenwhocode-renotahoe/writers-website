# define base admin user
admin_user = User.create!(
	email: 'admin@womenwhocoderenotahoe.com',
	password: 'Hermione',
	admin: true,
  time_zone: 'Pacific Time (US & Canada)')

# Writer 1
user1 = User.create!(
	email: 'tina@gmail.com',
	password: 'testpage',
	admin: false,
  state: 'Profile complete',
  time_zone: 'Pacific Time (US & Canada)'
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

story2 = Story.create!(
   writer_id: writer1.id,
   title: "Trip the light fantastic",
   summary: "Ticking away the moments that make up a dull day.",
   body: "Ticking away the moments that make up a dull day
You fritter and waste the hours in an offhand way.
Kicking around on a piece of ground in your home town
Waiting for someone or something to show you the way.

Tired of lying in the sunshine staying home to watch the rain.
You are young and life is long and there is time to kill today.
And then one day you find ten years have got behind you.
No one told you when to run, you missed the starting gun.

So you run and you run to catch up with the sun but it's sinking
Racing around to come up behind you again.
The sun is the same in a relative way but you're older,
Shorter of breath and one day closer to death.

Every year is getting shorter never seem to find the time.
Plans that either come to naught or half a page of scribbled lines
Hanging on in quiet desperation is the English way
The time is gone, the song is over,
Thought I'd something more to say.",
  published: true
  )

# Writer 2
user2 = User.create!(
	email: 'suzy@gmail.com',
	password: 'testpage',
	admin: false,
  state: 'Profile complete',
  time_zone: 'Pacific Time (US & Canada)'
  )

writer2 = Writer.find_or_initialize_by(user_id: user2.id)
writer2.update!(
  full_name: 'Suzy SeeMe',
  twitter: '@lookatme',
  location: 'Reno',
  bio: 'Childrens stories are my thing. Fostering the imagination or kids, teaching for a greater future.'
  )

story1 = Story.create!(
   writer_id: writer2.id,
   title: "A dog named Roo",
   summary: "Roo, an excitable, friendly, squeaky toy hogging dog.",
   body: "She blasted through the screen door without a care in the world. The only thing on her mind was the big red ball that she was sure she heard calling her name, ’Roo, Roo.’ She jumped across from the deck to the lawn, completely missing the walkway, pouncing on the ball as it let out a terrified squeak. Landing with such vigor, rolling several times before coming to a stop near the pile of dirt.",
  published: true
  )

story2 = Story.create!(
   writer_id: writer2.id,
   title: "Me and you and a dog named Boo",
   summary: "Traveling and living off the land.",
   body: "I remember to this day
The bright red Georgia clay
And how it stuck to the tires
After the summer rain
Will power made that old car go
A woman's mind told me that so
Oh how I wish
We were back on the road again
Me and you and a dog named boo
Travellin' and livin' off the land
Me and you and a dog named boo
How I love being a free man
I can still recall
The wheat fields of St. Paul
And the morning we got caught
Robbing from an old hen
Old McDonald he made us work
But then he paid us for what it was worth
Another tank of gas
And back on the road agin.",
  published: true
)

# Writer 3
user3 =User.create!(
  email: 'mary@gmail.com',
  password: 'testpage',
  admin: false,
  state: 'Profile complete',
  time_zone: 'Pacific Time (US & Canada)'
  )

writer3 = Writer.find_or_initialize_by(user_id: user3.id)
writer3.update!(
  full_name: 'Mary Maybe',
  twitter: '@notU',
  location: 'Sparks',
  bio: 'Started writing mystery ghost stories and real life mysteries when my house-spirit seemed to be asking for help.'
  )

story1 = Story.create!(
   writer_id: writer3.id,
   title: "The girl in the hallway.",
   summary: "The story about a little girl lost in time, trapped in another world.",
   body: "Her name was Sarah when she lived in the 1800’s, on a little farm where this subdivision now stands.",
  published: true
  )

story2 = Story.create!(
   writer_id: writer3.id,
   title: "Green Eggs and Ham",
   summary: "Yes, this is a Dr. Suess title.",
   body: "Since this is a test file, I can do whatever I want.",
  published: true
  )

