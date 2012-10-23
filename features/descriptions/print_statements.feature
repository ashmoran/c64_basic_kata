Feature: PRINT
  Scenario: A bare “print” statement produces a single newline
    Given a file named "print.c64b" with:
      """
      PRINT
      """
    When I successfully run `c64basic print.c64b`
    Then the stdout should contain exactly:
      """


      """
    And the stderr should be empty

  Scenario: A “print” statement can have a constant string as an argument
    Given a file named "print_string.c64b" with:
      """
      PRINT "Hello, World!"
      """
    When I successfully run `c64basic print_string.c64b`
    Then the stdout should contain exactly:
      """
      Hello, World!

      """
    And the stderr should be empty

  Scenario: Two or more statements in a sequence are executed one after the other
    Given a file named "print_many_strings.c64b" with:
      """
      PRINT "Hi"
      PRINT "There"
      PRINT "!"
      """
    When I successfully run `c64basic print_many_strings.c64b`
    Then the stdout should contain exactly:
      """
      Hi
      There
      !

      """
    And the stderr should be empty