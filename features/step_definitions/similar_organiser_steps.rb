Given(/^someone else likes Star Wars$/) do
  @timmy = Organiser.make!(:timmy)
  @interest = Interest.make!
  @timmy.interests << @interest
end