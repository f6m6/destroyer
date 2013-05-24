When(/^I fill in "(.*?)" with "(.*?)"$/) do |page_url, url|
  fill_in page_url, with: url
end

When(/^I press "(.*?)"$/) do |button|
  click_button button
end

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content text
end
