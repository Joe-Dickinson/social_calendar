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

Event.blueprint do
  title { "Nine Worlds Geek Fest 2014"}
  url { "https://nineworlds.co.uk/" }
  description { "Lorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."}
end