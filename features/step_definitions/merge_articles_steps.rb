require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

#Given an administrator with login "admin"

Given /^(?:a|an) (.+) with login "(.+)"$/ do |profile_label, login|
  User.create!({:login => login,
                :password => "aaaaaaaa",
                :email => "#{login}@mail.com",
                :profile_id => Profile.find_by_label(profile_label).id,
                :name => login,
                :state => 'active'})
end

And /^the following articles exist:$/ do |articles_table|
  articles_table.hashes.each do |article|
    Article.create(article)
  end
end

Given /^I am logged in as (.+)$/ do |login|
  visit '/accounts/login'
  fill_in 'user_login', :with => login
  fill_in 'user_password', :with => 'aaaaaaaa'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

And /^I am editing an article titled "(.+)"$/ do |title|
  visit path_to("edit article '#{title}'")
end

Then /^I should see the (.+) field$/ do |field_name|
end
