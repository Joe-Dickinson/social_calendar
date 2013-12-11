Given(/^that a participant is on the sign in page$/) do
  visit new_participant_session_url
end

Given(/^that he is already registered$/) do
  @participant = Participant.make!
end

Given(/^some events exist$/) do
  @event = Event.make!
end

Given(/^he enters valid data$/) do
  fill_in "Email", :with => "d@d.com"
  fill_in "Password", :with => "password"
end

Then(/^he should be successfully signed in$/) do
  expect(page).to have_content("Welcome David")
end

Then(/^he should see his event feed$/) do
  expect(page).to have_content("Nine Worlds")
end

Given(/^that an organiser is on the sign in page$/) do
  visit new_organiser_session_url
end

Given(/^that she is already registered$/) do
  @organiser = Organiser.make!
end

Given(/^she enters valid data$/) do
  fill_in "Email", :with => "e@e.com"
  fill_in "Password", :with => "password"
end

Given(/^she clicks the "(.*?)" button$/) do |button|
  click_button button
end

Then(/^she should be successfully signed in$/) do
  expect(page).to have_content("Welcome Emily")
end

Then(/^she should see her event feed$/) do
  expect(page).to have_content("Nine Worlds")
end