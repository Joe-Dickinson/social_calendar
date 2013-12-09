Feature: Edit participant profile
  Scenario: A participant edits their profile
    Given that a participant is on the edit profile page
    And he enters valid data
    And he clicks "update my profile"
    Then he should be taken to his profile page
    And he should see the changes displayed on his profile
