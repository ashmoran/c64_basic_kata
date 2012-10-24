Feature: Maths
  Scenario: Two numeric constants can be added together
    Given a file named "addition.c64b" with:
      """
      PRINT 3 + 7
      """
    When I successfully run `c64basic addition.c64b`
    Then the stdout should contain exactly:
      """
      10

      """
    And the stderr should be empty

  Scenario: A numeric expression can have more than two terms
    Given a file named "multiple_addition.c64b" with:
      """
      PRINT 4 + 4 + 12
      """
    When I successfully run `c64basic multiple_addition.c64b`
    Then the stdout should contain exactly:
      """
      20

      """
    And the stderr should be empty

  Scenario: A numeric expression can be built with variables and/or constants
    Given a file named "addition_with_variables.c64b" with:
      """
      A=2
      B=7
      PRINT A + 1
      PRINT A + B
      PRINT 99 + B
      """
    When I successfully run `c64basic addition_with_variables.c64b`
    Then the stdout should contain exactly:
      """
      3
      9
      106

      """
    And the stderr should be empty

  Scenario: Two numeric expressions can be subtracted
    Given a file named "subtraction.c64b" with:
      """
      PRINT 1 - 2
      """
    When I successfully run `c64basic subtraction.c64b`
    Then the stdout should contain exactly:
      """
      -1

      """
    And the stderr should be empty

