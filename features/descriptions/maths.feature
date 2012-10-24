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