source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.3.5'

gem 'rails', '~> 7.2'
gem 'bootsnap', require: false

gem 'puma', ">= 5.0"
gem 'pg','~> 1.5.3'
gem 'rails_12factor', '~> 0.0.3', group: :production
gem 'activerecord-postgis-adapter', ">= 10"
gem 'aws-sdk-s3', '~> 1.126.0'
gem 'sidekiq', '~> 7.1.2'
gem 'redis', '~> 4.2.5'
gem "rorvswild", "~> 1.6.4"
gem 'bugsnag', '~> 6.25.2'
gem 'pg_search', '~> 2.3.6'

gem "importmap-rails", "~> 2.0"
gem 'turbo-rails', '~> 2.0'
gem 'stimulus-rails', '~> 1.3'
gem "tailwindcss-rails", "~> 2.3"

gem "sprockets-rails"
gem 'sass-rails', '>= 6'
gem 'jbuilder', '~> 2.11.5'
gem 'image_processing', '~> 1.2'
gem 'rack-cors', '~> 2.0.1'

gem 'kaminari', '~> 1.2.2'
gem 'httparty', '~> 0.21.0'
gem 'colorize', '~> 1.1.0'
gem "audited"

gem 'rgeo-geojson', '~> 2.1.1'

# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'differ', '~> 0.1.2'
gem "breadcrumbs_on_rails", '~> 4.1.0'
gem 'meta-tags'

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem 'pry'
  gem 'dotenv-rails'
end

group :development do
  gem 'web-console'

  # scraping
  gem 'nokogiri'
end

group :test do
  gem 'capybara'
end
