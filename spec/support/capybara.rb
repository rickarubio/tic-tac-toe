require 'capybara/rails'
require 'capybara/rspec'

Capybara.default_wait_time = 3
Capybara.javascript_driver = :webkit

RSpec.configure do |config|
  config.before :each, :js do
    page.driver.block_unknown_urls
  end
end
