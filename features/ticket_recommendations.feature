Feature: Magic Your Way Recommendations
  In order to get an idea of what tickets to purchase
  A ticket wizard user
  Needs to enter a trip of 10 days or less 
  And any other ticket options

  Background:
    Given the ticket wizard is initialized
    And the park hopper price is set

  Scenario Outline: Buying tickets with no options
    Given the user has entered <days> into the wizard
    When they ask for recommendations
    Then the recommended tickets should have an adult magic your way ticket
    And the adult price should be <adult_price>
    And the recommended tickets should have a child magic your way ticket
    And the child price should be <child_price>

  Scenario Outline: Buying tickets with the park hopper option
    Given the user has entered <days> into the wizard
    And they want the park hopper option
    When they ask for recommendations
    Then the recommended tickets should have an adult magic your way ticket
    And the adult price should be <adult_price> plus the park hopper price
    And the recommended tickets should have a child magic your way ticket
    And the child price should be <child_price> plus the park hopper price


  Examples:
    | days | adult_price | child_price |
    | 1    | 79          | 68          |
    | 2    | 156         | 133         |
    | 3    | 219         | 187         |
    | 4    | 225         | 192         |
    | 5    | 228         | 195         |
    | 6    | 231         | 198         |
    | 7    | 234         | 201         |
    | 8    | 237         | 204         |
    | 9    | 240         | 207         |
    | 10   | 243         | 210         |
