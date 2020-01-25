# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.5"

# User Posts - for next feature [mario]
gem "public_activity"
# For user/admin
gem "devise"
# Using SHA Encryption instead of normal bcrypt
gem "devise-encryptable"
# Using sendgrid as mailer addon
gem "sendgrid-ruby"
# for default profile avatar
gem "gravatar_image_tag", "~> 1.2"
# for cropping image
gem "image_processing", "~> 1.2"
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 6.0.1.rc1"
# Use Puma as the app server
gem "puma", "~> 4.1"
gem "jquery-rails"
# Use SCSS for stylesheets
gem "sass-rails", ">= 6"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker", "~> 4.0"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.7"
# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"
# Use Active Model has_secure_password
gem "bcrypt", "~> 3.1.7"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.2", require: false
gem "bootstrap", "~> 4.3.1"
gem "font-awesome-sass", "~> 5.11.2"
gem "simple_form"

group :development, :test do
  gem "rspec-rails"
  # testing user feature
  gem "factory_bot_rails"
  gem "rails-controller-testing"
  gem "action-cable-testing"
  gem "capybara"
  gem "ffaker"
  # Use sqlite3 as the database for Active Record
  gem "sqlite3"
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  # Pry is a powerful alternative to the standard IRB shell for Ruby
  gem "pry-rails"
  # Step-by-step debugging and stack navigation in Pry
  gem "pry-byebug", platform: :ruby
  # Pretty print your Ruby objects with style -- in full color and with proper indentation
  gem "awesome_print"
  # Use for fighting the N+1 problem in Ruby
  gem "bullet"
  gem "rails_layout"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "web-console", ">= 3.3.0"
  # Guard is a command line tool to easily handle events on file system modifications
  gem "guard", require: false
  # minitest guard runs the minitests when needed
  gem "guard-minitest", require: false
  # bundler-audit provides patch-level verification for Bundled apps
  gem "bundler-audit", require: false
  # Bundler guard allows to automatically & intelligently install/update bundle when needed.
  gem "guard-bundler", require: false
  # compare licenses against a user-defined whitelist, and give you an actionable exception report
  gem "license_finder", ">= 3.1.1", require: false
  # Brakeman is an open source static analysis tool which checks Rails applications for security vulnerabilities.
  gem "brakeman", require: false
  # Guard::Brakeman automatically scans your Rails app for vulnerabilities using the Brakeman Scaner
  gem "guard-brakeman", require: false
  # Better Errors replaces the standard Rails error page with a much better and more useful error page
  gem "better_errors"
  # necessary to use Better Errors' advanced features
  gem "binding_of_caller", platforms: :ruby
  # RuboCop configuration which has the same code style checking as official Ruby on Rails
  gem "guard-rubocop", require: false
  gem "rubocop-rails_config", require: false
  # i18n-tasks helps you find and manage missing and unused translations
  gem "i18n-tasks", require: false
  # IYE makes it easy to translate your Rails I18N files and keeps them up to date
  gem "iye", require: false
  # Preview email in the default browser instead of sending it.
  gem "letter_opener"
  gem "dotenv-rails"
end

group :test do
  # Strategies for cleaning databases in Ruby. Can be used to ensure a clean state for testing.
  gem "database_cleaner"
  # Code coverage for Ruby
  gem "simplecov", require: false
  # Collection of testing matchers extracted from Shoulda
  gem "shoulda-matchers"
  # Adds support for Capybara system testing and selenium driver
  gem "capybara"
  gem "selenium-webdriver"
  # Easy installation and use of chromedriver to run system tests with Chrome
  # gem "chromedriver-helper" # <== DEPRACTED USE INSTEAD: webdrivers
  gem "webdrivers", "~> 4.0"
  # Speedup RSpec + Cucumber by running parallel on multiple CPU cores
  gem "parallel_tests"
end
group :production do
  # Use postgreSQL for heroku
  gem "pg", ">= 0.20.0"
end

if Gem.win_platform?
  # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
  gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
  # to avoid polling for changes
  gem "wdm", ">= 0.1.0"
end
