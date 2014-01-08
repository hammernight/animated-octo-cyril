Feature: Asset Performance Examples

  Scenario: Example using derp-bear
    Given I complete the derp-bear simple form example
    When I submit the derp-bear simple form example
    And I let firebug catch up
    Then The HAR file should be successfully created
    Given I do a Google search
    When I choose the first search result
    And I let firebug catch up
    Then The HAR file should be successfully created

#  Scenario: Example using Google
#    Given I do a Google search
#    When I choose the first search result
#    And I let firebug catch up
#    Then The HAR file should be successfully created