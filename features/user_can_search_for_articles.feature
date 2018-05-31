Feature: User can search for articles
  As a User
  In order to find specific content or articles of interest
  I would like to have the ability to search for articles

Background:

Given we have the following articles
  | headline                   |
  | The awesome article        |
  | The other avesome article  |
  | Another article            |

Scenario: User searches for articles in appliation
  Given user is signed in
  And I am on the landing page
  When I fill in "Search" with "Awesome"
  And I click "Search"
  Then I should see "Found 2 articles"
  # Then I should see "The awesome article"
  # Then I should see "The awesome article"
  
