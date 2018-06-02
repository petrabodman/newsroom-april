@search
Feature: User can search for articles
  As a User
  In order to find specific content or articles of interest
  I would like to have the ability to search for articles

Background:
  Given the following users exist
    | email                 | role        |
    | subscriber@test.com   | subscriber  |

Given we have the following articles
  | headline                   |
  | The awesome article        |
  | The other awesome article  |
  | Another article            |

Scenario: User searches for articles in appliation
  Given I am signed in as "subscriber@test.com"
  And I am on the landing page
  When I fill in "Search" with "Awesome"
  And I click "Search"
  Then I should see "Found 2 articles"
  And I should see "The awesome article"
  And I should see "The other awesome article"
  And I should not see "Another article"
