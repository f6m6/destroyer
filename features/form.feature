Feature: Form
  In order to create a new page
  A visitor
  Should enter its URL into the form

  Scenario: Creating a page using the form
    Given I am on the homepage
    When I fill in "Url" with "yahoo.com"
    When I press "Save"
    Then I should be on the "yahoo.com" page
    
  Scenario: Trying to create an invalid page
    Given I am on the homepage
    When I fill in "Url" with "::::"
    When I press "Save"
    Then I should see "Url is not a valid URL"
     And I am on the homepage
