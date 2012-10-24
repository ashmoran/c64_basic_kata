Feature: Variables
  A single letter is a variable.
  The print statement can print its value.

  Scenario: The default value for a variable is 0
    Given a file named "undefined_variable.c64b" with:
      """
      PRINT A
      """
    When I successfully run `c64basic undefined_variable.c64b`
    Then the stdout should contain exactly:
      """
      0

      """
    And the stderr should be empty

  Scenario: An assignment statement binds a value to a variable
    Given a file named "undefined_variable.c64b" with:
      """
      A=12
      PRINT A
      """
    When I successfully run `c64basic undefined_variable.c64b`
    Then the stdout should contain exactly:
      """
      12

      """
    And the stderr should be empty
