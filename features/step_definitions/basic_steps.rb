Given("I am on the landing page") do
  visit root_path
end

Given("we have the following articles") do |table|
  table.hashes.each do |article|
    create(:article, article)
  end
end

Given("we have the following user") do |table|
  table.hashes.each do |user|
    create(:user, user)
  end
end

When("I click {string}") do |link|
  click_link_or_button link
end
