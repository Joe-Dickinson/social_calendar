Feature: Similar Organiser
  
  Scenario: An organiser declares an interest
  Given that I am signed in
  And I am on the events feed page
  And someone else likes Star Wars
  And I am on my profile page
  When I write Star Wars into the text box
  And I click add
  Then I should see Star Wars appear in my interests

  Scenario: An organiser is shown a similar organiser based on their mutual interests
  Given that I am signed in
  And I am on the events feed page
  And I click on similar people
  Then I should see a similar person to me
  And they should have one similar interest