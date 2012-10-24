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
    Given a file named "variable_assignment.c64b" with:
      """
      A=12
      PRINT A
      """
    When I successfully run `c64basic variable_assignment.c64b`
    Then the stdout should contain exactly:
      """
      12

      """
    And the stderr should be empty

  Scenario: Assign anything to a variable
    This isn't one of the kata scenarios, but it worked by sheer magic due
    to the way I implemented it. It's in the examples folder, but I wanted
    to preserve this behaviour with a test.

    Given a file named "magic_variable_stuff.c64b" with:
      """
      N=10
      S="Watch this!"
      M=N
      PRINT "N is"
      PRINT N
      PRINT S
      PRINT "M is"
      PRINT M
      """
    When I successfully run `c64basic magic_variable_stuff.c64b`
    Then the stdout should contain exactly:
      """
      N is
      10
      Watch this!
      M is
      10

      """
    And the stderr should be empty


