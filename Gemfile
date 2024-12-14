source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.3.5'

gem 'ostruct' # temporary

gem 'rails', '~> 8.0'
gem 'bootsnap', require: false

gem 'puma', ">= 5.0"
gem 'pg'
gem 'activerecord-postgis-adapter', github: "StoneGod/activerecord-postgis-adapter", branch: "rails-8"
gem 'aws-sdk-s3'
gem 'sidekiq', '~> 7.1.2' # TODO: remove
gem 'redis', '~> 4.2.5' # TODO: remove
gem "rorvswild", "~> 1.6.4" # TODO: remove
gem 'bugsnag'
gem 'pg_search'

gem "propshaft"
gem "importmap-rails"
gem 'turbo-rails'
gem 'stimulus-rails'
gem "tailwindcss-rails"
# gem "tailwindcss-ruby", "3.4.13" # pin to tailwindcss version 3.4.13

gem 'image_processing', '~> 1.2'
gem 'rack-cors'

gem 'kaminari'
gem 'httparty'
gem 'colorize'
gem "audited"

gem 'rgeo-geojson', '~> 2.1.1' # TODO: update

# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'differ'
gem "breadcrumbs_on_rails"
gem 'meta-tags'

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem 'pry'
  gem 'dotenv-rails'
end

group :development do
  gem 'web-console'
  gem 'nokogiri'
end

group :test do
  gem 'capybara'
end
