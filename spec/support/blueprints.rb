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
  email { "e@e.com"}
  password { "password" }
end

Event.blueprint do
  title { "Nine Worlds Geek Fest 2014"}
  url { "https://nineworlds.co.uk/" }
  description { Faker::Lorem.words(50).join(" ")}
  organiser
end
