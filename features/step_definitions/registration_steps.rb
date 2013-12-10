Given(/^a participant is on the registration page$/) do
  visit new_participant_registration_url
end

Given(/^he enters valid information$/) do
  fill_in "Name", :with => "Charles"
  fill_in "Email", :with => "c@c.com"
  fill_in "Password", :with => "password"
  fill_in "Password confirmation", :with => "password"
end

Given(/^he clicks the "(.*?)" button$/) do |submit|
  click_button submit
end

Then(/^he should be registered with the site$/) do
  expect(page).to have_content "Welcome Charles"
end