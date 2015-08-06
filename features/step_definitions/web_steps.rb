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

Given(/^I go to the create_story page$/) do
  visit '/create_story'
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
    fill_in "#{arg1}", with: "#{arg2}"
end
