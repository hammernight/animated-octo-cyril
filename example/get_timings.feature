Feature: Get Web timings

  In order to compare the web timings of scenarios for a web site
  as a automated test
  I want to collect har files from each scenario

  the idea is to visit a site get some web timings to compare with the next run


  Scenario: Get a web timing for derp bear
    Given I successfully complete the simple form example
    When I submit the simple form example
    And I let firebug catch up
    Then the har file should be successfully created