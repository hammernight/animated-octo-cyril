Given(/^I successfully complete the simple form example$/) do
  @browser.goto "http://derp-bear.herokuapp.com/"
  @browser.link(id: 'simple_form_example').click

  binding.pry
end

Then(/^the har file should be successfully created$/) do
  pending # express the regexp above with the code you wish you had
end