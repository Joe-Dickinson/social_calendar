Given(/^someone else has created an event$/) do
  Event.make!
end

Then(/^I should see the event$/) do
  expect(page).to have_content("Nine Worlds Geek Fest 2014")
end

Then(/^I should see that I am going to the event$/) do
  expect(page).to have_content("People going to this event: Emily")
end