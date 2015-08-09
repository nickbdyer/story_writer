require 'capybara'

Given(/^I am on the homepage$/) do
  visit '/'
end

When(/^I press "([^"]*)" within "([^"]*)"$/) do |arg1, arg2|
  page.within(:css, "#{arg2}") do
    click_button "#{arg1}"
  end
end

Then(/^I should see "([^"]*)" within "([^"]*)"$/) do |arg1, arg2|
  page.within(:css, "#{arg2}") do
    expect(page).to have_content("#{arg1}")
  end
end

Given(/^I am on the first page of the story$/) do
  steps 'Given I am on the homepage'
  steps 'When I press "New Story" within "body" '
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
    fill_in "#{arg1}", with: "#{arg2}"
end

Given(/^I have written the first line already$/) do
  page.within(:css, ".previous-phrase") do
    fill_in "newline", with: "Once upon a time..."
    click_button "Submit"
  end
end

When(/^I fill in "([^"]*)" with "([^"]*)" within "([^"]*)"$/) do |arg1, arg2, arg3|
  page.within(:css, "#{arg3}") do
    fill_in "#{arg1}", with: "#{arg2}"
  end
end

When(/^I press the link "([^"]*)" within "([^"]*)"$/) do |arg1, arg2|
  page.within(:css, "#{arg2}") do
    click_link "#{arg1}"
  end
end
