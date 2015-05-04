source 'https://rubygems.org'

ruby '2.2.2'


gem 'rails', '4.2.1'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'unicorn'
gem 'bourbon'

source 'https://rails-assets.org' do
  gem 'rails-assets-jquery-readyselector'
end

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :test do
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'shoulda-matchers'
end

group :production do
  'rails_12factor'
end
