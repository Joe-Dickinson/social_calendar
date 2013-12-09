Feature: Event publishing
  Scenario: An event organiser publishes an event
    Given that an event organiser is on the event creation page
    And she fills enters valid data
    And she clicks "publish event"
    Then the event should appear in the event feed