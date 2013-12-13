Feature: Create Event

  Scenario: An organiser visits the new event page
    Given that I am signed in
    And I am on the events feed page
    When I click "Create New Event"
    Then I should see the new event page

    @wip
  Scenario: An organiser creates a new event
    Given that I am signed in
    And that I am on the new event page
    And I enter valid data
    And I click on the "Save" button
    Then I should be redirected to my events feed
    And I should see my event