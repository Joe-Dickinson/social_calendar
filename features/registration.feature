Feature: Registration
  Scenario: A participant signs up
    Given a participant is on the registration page
    And he enters valid information
    And he clicks the "Sign up" button
    Then he should be registered with the site

    Scenario: An event organiser signs up
    Given an organiser is on the registration page
    And she enters valid information
    And she clicks the "Sign up" button
    Then she should be registered with the site