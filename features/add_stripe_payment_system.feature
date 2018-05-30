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
    And show me the page
    Then I click "Become subscriber" stripe button
    And I click "Pay with Card" stripe button
    And I fill in the stripe field "Card number" with "4242 4242 4242 4242"
    And I fill in the stripe field "CVC" with "123"
    And I fill in the stripe field "Expiry" with "12/2020"
    And I submit stripe form
    Then I should be on the landing page
    And I should see "Welcome as a subscriber"
