Given /^I successfully complete the simple form example$/ do
  @browser.goto 'http://derp-bear.herokuapp.com/'
end

When /^I submit the simple form example$/ do
  @browser.link(id: 'simple_form_example').click
end

When /^I let firebug catch up$/ do
  sleep 1
end

Then /^The HAR file should be successfully created$/ do
  pending # express the regexp above with the code you wish you had
end