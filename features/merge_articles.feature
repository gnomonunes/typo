Feature: Merge Articles
  As a blog administrator
  In order to avoid content duplication
  I want to be able to merge articles

  Background:
    Given the blog is set up
    And a publisher with login "publisher"
    And the following articles exist:
    | title           | body           | state     | author     |
    | Hello World     | body article 1 | published | author one |
    | Hello Earth     | body article 2 | published | author two |

  Scenario: admin edits an article
    Given I am logged in as admin
    And I am editing an article titled "Hello World"
    Then I should see "merge_with"

  Scenario: publisher edits an article
    Given I am logged in as publisher
    And I am editing an article titled "Hello World"
    Then I should not see "merge_with"
