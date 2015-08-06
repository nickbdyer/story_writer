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
    When I fill in "current-line" with "Once upon a time..." within "story-table"
    Then I should see "Once upon a time..." within "current-line"
