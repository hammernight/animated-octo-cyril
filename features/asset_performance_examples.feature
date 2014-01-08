Feature: Asset Performance Examples

  Scenario: Example using derp-bear
    Given I complete the derp-bear simple form example
    When I submit the derp-bear simple form example
    And I let firebug catch up
    Then The HAR file should be successfully created


  Scenario: another Example using derp-bear
    Given I visit the knockoutjs example
    When I add some items to my list
    Then I should see my item in my list
    And I let firebug catch up
    And The HAR file should be successfully created
