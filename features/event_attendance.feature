Feature: Event Attendance

  Scenario: An organiser declares they are going to an event
  Given someone else has created an event
  And that I am signed in
  And I am on the events feed page
  Then I should see the event
  When I click on the "Attend" button
  Then I should see that I am going to the event