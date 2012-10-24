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
