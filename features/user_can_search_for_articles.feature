Feature: User can search for articles
  As a User
  In order to find specific content or articles of interest
  I would like to have the ability to search for articles

Background:
Given we have the following articles
  | headline                  | content     |
  | The awesome article       | Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. |

Scenario: User searches for articles in appliation
  Given I am on the landing page
  When I fill in "Search field" with "Awesome"
  And I click "Search"
  Then I should see "The awesome article"
  
