When(/^I destroy "(.*?)"$/) do |url|
  fill_in 'page_url', with: url
  click_button 'Save'
end

Then(/^I should be on the "(.*?)" page$/) do |url|
  named_page = Page.where(url: url).first!
  current_path.should == page_path(named_page)
end

Then(/^I should see the destroyed "(.*?)" markup$/) do |url|
  page.should have_selector "h1.signature"
end
