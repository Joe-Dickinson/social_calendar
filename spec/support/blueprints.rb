require 'machinist/active_record'

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end

Participant.blueprint do 
  name { "David" }
  email { "d@d.com" }
  password { "password" }
end

Organiser.blueprint do
  name { "Emily" }
  email { Faker::Internet.email }
  password { "password" }
end

Organiser.blueprint(:timmy) do
  name { "Timmy" }
  email { Faker::Internet.email }
  password { "password" }
end

Organiser.blueprint(:sally) do
  name { "Sally" }
  email { Faker::Internet.email }
  password { "password" }
end

Event.blueprint do
  title { "Nine Worlds Geek Fest 2014"}
  url { "https://nineworlds.co.uk/" }
  description { Faker::Lorem.words(50).join(" ")}
  organiser 
end

Interest.blueprint do
  tag { "Star Wars" }
end

Interest.blueprint(:bad) do
  tag { "PHP" }
end

Guest.blueprint do
  # event_id
  # organiser_id
end

Like.blueprint do
  # organiser_id
  # interest_id
end
