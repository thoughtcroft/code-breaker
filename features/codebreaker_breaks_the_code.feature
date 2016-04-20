Feature: code-breaker breaks the code

  As a code-breaker
  I want confirmation of success
  So that I know when I have broken the code

  Scenario: guesses code correctly
    Given I am playing the game
    And the secret code is '1234'
    When I submit guess '1234'
    Then I should see "++++"
    And I should also see "Congratulations, you broke the code in 1 guess!"
