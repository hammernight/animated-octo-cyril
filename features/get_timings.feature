Feature: Get Web Timings

  In order to compare the web timings of scenarios for a web site
  as a automated test
  I want to collect har files from each scenario

  Scenario: Get a web timing for derp bear
    Given I successfully complete the simple form example
    When I submit the simple form example
    And I let firebug catch up
    Then The HAR file should be successfully created