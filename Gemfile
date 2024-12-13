source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.3.5'

gem 'rails', '~> 7.2'
gem 'bootsnap', require: false

gem 'puma', ">= 5.0"
gem 'pg'
gem 'activerecord-postgis-adapter', ">= 10"
gem 'aws-sdk-s3'
gem 'sidekiq', '~> 7.1.2' # TODO: remove
gem 'redis', '~> 4.2.5' # TODO: remove
gem "rorvswild", "~> 1.6.4" # TODO: remove
gem 'bugsnag'
gem 'pg_search'

gem "importmap-rails", "~> 2.0"
gem 'turbo-rails', '~> 2.0'
gem 'stimulus-rails', '~> 1.3'
gem "tailwindcss-rails", "~> 2.3"

gem "sprockets-rails"
gem 'sass-rails', '>= 6'
gem 'jbuilder', '~> 2.11.5' # TODO: remove
gem 'image_processing', '~> 1.2'
gem 'rack-cors', '~> 2.0.1'

gem 'kaminari'
gem 'httparty'
gem 'colorize'
gem "audited"

gem 'rgeo-geojson', '~> 2.1.1'

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
