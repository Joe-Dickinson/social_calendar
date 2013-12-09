Feature: Sign in
  Scenario: A participant signs in 
    Given that a participant is on the sign in page
    And he enters valid data
    And he clicks the "sign in" button
    Then he should be successfully signed in
    And he should see his event feed

  Scenario: An event organiser signs in
    Given that an organiser is on the sign in page
    And she enters valid data
    And she clicks the "sign in" button
    Then she should be successfully signed in
    And she should see her event feed