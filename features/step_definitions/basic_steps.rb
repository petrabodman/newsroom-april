Given /I am on the landing page/ do
  visit root_path(locale: 'en')
end

Given("we have the following articles") do |table|
  table.hashes.each do |article|
    category = article["category"]
    user_email = article["user"]
    article["category"] = Category.find_by(name: category) if category != nil
    article["user"]= User.find_by(email: user_email) if user_email != nil
    create(:article, article)
  end
end

Given("we have the following categories") do |table|
  table.hashes.each do |category|
    create(:category, category)
  end
end

When("I click {string}") do |link|
  click_link_or_button link
end

When("I fill in {string} with {string}") do |field, text|
  fill_in field, with: text
end

When("I select {string} from categories menu") do |option|
  select option, from: 'article_category_id'
end

Given("user is signed in") do
  user = create(:user)
  login_as user
end

Given("I am on the {string} page") do |article_title|
  article = Article.find_by(headline: article_title)
  visit article_path(article, locale: 'en')
end

Given("the following users exist") do |table|
  table.hashes.each do |user|
    create(:user, user)
  end
end

Given("I am signed in as {string}") do |user_email|
  user = User.find_by(email: user_email)
  login_as user
end

When("I visit the new article page") do
  visit new_article_path
end

When("I visit {string} edit page") do |article_title|
  article = Article.find_by(headline: article_title)
  visit edit_article_path(article)
end

Given("I click {string} stripe button") do |button|
   click_link_or_button
   sleep 2
   @stripe_iframe = all(iframe[name=stripe_checkout_app]).last
end

Given("I fill in the stripe field {string} with {string}") do |field_name, value|
  within_iframe @stripe_iframe do
    fill_in field_name, with: value
  end
end

Given("I submit stripe form") do
  within_iframe @stripe_iframe do
    find('.Section-button').click
  end
end
