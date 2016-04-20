Feature: code-breaker completes game

  As a code-breaker
  I want confirmation of success
  So that I know when the game is complete

  Scenario: complete game
    Given I am playing the game
    And the secret code is '1234'
    When I submit guess '1234'
    Then I should see "++++"
    And I should also see "Congratulations, you broke the code!"
