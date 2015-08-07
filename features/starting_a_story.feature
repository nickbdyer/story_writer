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
    When I fill in "input-box-0" with "Once upon a time..." 
    And I press "Submit" within ".previous-phrase"
    Then I should see "Once upon a time..." within ".previous-phrase"

  Scenario: Writing the next lines
    Given I go to the create_story page
    When I fill in "input-box-1" with "There was a tiger" 
    And I press "Submit" within ".phrase1"
    Then I should see "There was a tiger" within ".phrase1"
