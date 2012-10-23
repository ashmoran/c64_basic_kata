Feature: PRINT
  Scenario: A bare “print” statement produces a single newline
    Given a file named "empty.c64b" with:
      """
      PRINT
      """
    When I successfully run `c64basic empty.c64b`
    Then the stdout should contain exactly:
      """


      """
    And the stderr should be empty



