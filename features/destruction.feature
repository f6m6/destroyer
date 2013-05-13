Feature: Destruction

  Scenario: Destroying a page that exists
    Given I am on the homepage
    When I destroy "yahoo.com"
    Then I should be on the "yahoo.com" page
    And I should see the destroyed "yahoo.com" markup
