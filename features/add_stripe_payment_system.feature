Feature: Owner can receive payment via stripe
  As a Owner
  In order to receive payments from subscribers
  I would like to have payment system connected to the site

Background:
          |email          | password |
          |test@test.com  | 12345678 |

  Scenario: User signs up and buys a subscription
    Given I am on the landing page
    And I click "Sign Up"
    And I fill in "Email" with "test@test.com"
    And I fill in "Password" with "12345678"
    And I click "Sign Up"
    Then I should see "Final Signup Step"
    And I click "Pay with Card"
    And I should see "6 month subscription"
