Given /^I complete the derp-bear simple form example$/ do
  @browser.goto 'http://derp-bear.herokuapp.com/'
end

When /^I submit the derp-bear simple form example$/ do
  @browser.link(id: 'simple_form_example').click
end