When(/^I destroy "(.*?)"$/) do |url|
  fill_in 'page_url', with: url
  click_button 'Save'
end

Then(/^I should be on the "(.*?)" page$/) do |page|
  current_path.should == pages_path(page)
end

Then(/^I should see the destroy "(.*?)" markup$/) do |arg1|
  pending # express the regexp above with the code you wish you had
  # page.should have_selector('')
end
