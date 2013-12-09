Feature: List of Eventbrite events
  Scenario: A participant sees a list events from Eventbrite
    Given that a participant is signed in
    And that he is on the event feed page
    Then he will see events from Eventbrite