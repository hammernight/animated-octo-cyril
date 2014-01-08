Given /^I do a Google search$/ do
  @browser.goto 'http://google.com'
  @browser.text_field(id: 'gbqfq').set 'Manheim'
  @browser.button(id: 'gbqfb').click
end

When /^I choose the first search result$/ do
  @browser.link(text: 'Manheim').when_present.click
end