Feature: Sign in
    @wip
  Scenario: A participant signs in 
    Given that a participant is on the sign in page
    And that he is already registered
    And some events exist
    And he enters valid data
    And he clicks the "Sign in" button
    Then he should be successfully signed in
    And he should see his event feed

  Scenario: An event organiser signs in
    Given that an organiser is on the sign in page
    And that she is already registered
    And some events exist
    And she enters valid data
    And she clicks the "Sign in" button
    Then she should be successfully signed in
    And she should see her event feed