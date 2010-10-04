Given /^the following landing_pages:$/ do |landing_pages|
  LandingPage.create!(landing_pages.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) landing_page$/ do |pos|
  visit landing_pages_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following landing_pages:$/ do |expected_landing_pages_table|
  expected_landing_pages_table.diff!(tableish('table tr', 'td,th'))
end
