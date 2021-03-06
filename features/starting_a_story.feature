Feature: Writing a story
  In order to write a multi-path story
  As a budding author
  I want to start writing

  Scenario: Starting a story
    Given I am on the homepage
    When I press "New Story" within "body"
    Then I should see "Write your first line in the center box!" within "body"

  Scenario: Writing the first line
    Given I am on the first page of the story
    When I fill in "newline" with "Once upon a time..." within ".previous-phrase" 
    And I press "Submit" within ".previous-phrase"
    Then I should see "Once upon a time..." within ".previous-phrase"

  Scenario: Writing the next lines
    Given I am on the first page of the story
    And I have written the first line already
    When I fill in "newline" with "There was a tiger" within ".lineA" 
    And I press "Submit" within ".lineA"
    Then I should see "There was a tiger" within ".lineA"
    And I should see "Once upon a time..." within ".previous-phrase"

  Scenario: Writing the 3rd lines
    Given I am on the first page of the story
    And I have written the first line already
    When I fill in "newline" with "There was a tiger" within ".lineA" 
    And I press "Submit" within ".lineA"
    And I press the link "There was a tiger" within ".lineA"
    Then I should see "There was a tiger" within ".previous-phrase"

  Scenario: Going back to the start of the story
    Given I have written multiple lines of a story
    And I press the link "Back to the start" within "body"
    Then I should see "Once upon a time..." within ".previous-phrase"
    And I should see "There was a tiger" within ".lineA"
    And I should see "There was a bear" within ".lineB"
