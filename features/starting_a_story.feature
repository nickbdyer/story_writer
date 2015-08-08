Feature: Writing a story
  In order to write a multi-path story
  As a budding author
  I want to start writing

  Scenario: Starting a story
    Given I am on the homepage
    When I press "New Story" within "body"
    Then I should see "Write your first line in the center box!" within "body"

  Scenario: Writing the first line
    Given I go to the create_story page
    When I fill in "newline" with "Once upon a time..." within ".previous-phrase" 
    And I press "Submit" within ".previous-phrase"
    Then I should see "Once upon a time..." within ".previous-phrase"

  Scenario: Writing the next lines
    Given I go to the create_story page
    And I have written the first line already
    When I fill in "newline" with "There was a tiger" within ".lineA" 
    And I press "Submit" within ".lineA"
    Then I should see "There was a tiger" within ".lineA"
    And I should see "Once upon a time..." within ".previous-phrase"

  Scenario: Writing the next lines
    Given I go to the create_story page
    And I have written the first line already
    When I fill in "newline" with "There was a tiger" within ".lineA" 
    And I press "Submit" within ".lineA"
    Then I should see "There was a tiger" within ".lineA"
    And I should see "Once upon a time..." within ".previous-phrase"
