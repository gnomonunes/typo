Feature: Merge Articles
  As a blog administrator
  In order to avoid content duplication
  I want to be able to merge articles

  Background:
    Given an administrator with login 'admin'
    And a blog publisher with login 'publisher'

  Scenario: admin edits an article
    Given I am logged in as admin
    And I am editing an article
    Then I should see the merge_with field

  Scenario: publisher edits an article
    Given I am logged in as publisher
    And I am editing an articles
    Then I should not sett the merge_with field
