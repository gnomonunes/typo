Feature: Add Category
  As a blog administrator
  In order to organize the content of my blog
  I want to be able to add categories

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully add categories
    Given I am on the categories page
    And I fill in "category_name" with "Music"
    And I fill in "category_keywords" with "fun"
    And I fill in "category_description" with "Music related stuff"
    And I press "Save"
    Then I should be on the categories page
    And I should see "Music"
