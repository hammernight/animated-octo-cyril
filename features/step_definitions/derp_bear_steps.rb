Given /^I complete the derp-bear simple form example$/ do
  @browser.goto 'http://derp-bear.herokuapp.com/'
end

When /^I submit the derp-bear simple form example$/ do
  @browser.link(id: 'simple_form_example').click
end

Given(/^I visit the knockoutjs example$/) do
  @browser.goto 'http://derp-bear.herokuapp.com/'
  @browser.link(id: 'knockoutjs_example').click
end

When(/^I add some items to my list$/) do
  @my_text = 'what?'
  @browser.text_field(id: 'add_item').when_present.set @my_text
  @browser.button(value: 'Add').click
end


Then(/^I should see my item in my list$/) do
  @browser.select_list(id: 'your_items_list').options.collect(&:text).should include(@my_text)
end