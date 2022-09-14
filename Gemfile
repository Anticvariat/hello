# frozen_string_literal: true

ruby '2.7.6'

# main gems
gem 'pg', '~> 1.1'
gem 'rails', '~> 6.0.5.1'

# other gems
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'bootsnap', '>= 1.4.2', require: false
gem 'bootstrap', '~> 5.2.0'
gem 'devise'
gem 'erb_lint', require: false
gem 'image_processing', '>= 1.2'
gem 'jbuilder', '~> 2.7'
gem 'kaminari'
gem 'puma', '~> 4.1'
gem 'rails_12factor', group: :production
gem 'rubocop-discourse', require: false
gem 'rubocop-rails', require: false
gem 'rubocop-rspec', require: false
gem 'sass-rails', '>= 6'
gem 'scss_lint', require: false
gem 'slim_lint'
gem 'turbo-rails'
gem 'webpacker', '~> 5.4.3'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 4.0'
end

group :development do
  gem 'brakeman'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'capybara-screenshot'
  gem 'faker'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
