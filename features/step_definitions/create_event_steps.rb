Given(/^that I am signed in$/) do
  @organiser = Organiser.make!
  visit new_organiser_session_path
  fill_in "Email", :with => @organiser.email
  fill_in "Password", :with => "password"
  click_button "Sign in"
end

Given(/^I am on the events feed page$/) do
  expect(page).to have_content("Welcome Emily")
end

When(/^I click "(.*?)"$/) do |new_event|
  click_link new_event
end

Then(/^I should see the new event page$/) do
  expect(page).to have_content("New Event")
end

Given(/^that I am on the new event page$/) do
  visit new_organiser_event_path(@organiser)
  expect(page).to have_content("New Event")
end

Given(/^I enter valid data$/) do
  fill_in "Title", :with => "New Years Eve Party"
  fill_in "Description", :with => Faker::Lorem.words(200).join(" ")
  fill_in "Url", :with => "www.example.com"
end

Given(/^I click on the "(.*?)" button$/) do |save_button|
  click_button save_button
end

Then(/^I should be redirected to my events feed$/) do
  expect(page).to have_content("Welcome Emily")
end

Then(/^I should see my event$/) do
  expect(page).to have_content("New Years Eve Party")
end