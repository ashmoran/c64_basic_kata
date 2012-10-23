Feature: Empty file
  An empty program produces no output

  Scenario: An empty file
    Given a file named "empty.c64b" with:
      """
      """
    When I successfully run `c64basic empty.c64b`
    Then the stdout should contain exactly:
      """
      """
    And the stderr should be empty
