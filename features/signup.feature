Feature: User signs_up to application
  As a user
  In order see full content of article
  I should be able to create an account

Background:
  Given we have the following user
    | email             | password        |
    | test@test.com     |  123456         |

Scenario: User signs_up for account
  Given I am on the landing page
  When I click "Sign up"
  And I fill in "Email" with "test@test.com"
  And I fill in "Password" with "123456"
  And I click "Sign up"
  Then I should see "Sign up successfully"
