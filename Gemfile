source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rails', '~> 7.1'
gem 'bootsnap', '~> 1.15.0', require: false

gem 'puma', '~> 6.3.0'
gem 'pg','~> 1.5.3'
gem 'rails_12factor', '~> 0.0.3', group: :production
gem 'activerecord-postgis-adapter', '~> 9.0.1'
gem 'aws-sdk-s3', '~> 1.126.0'
gem 'sidekiq', '~> 7.1.2'
gem 'redis', '~> 4.2.5'
gem 'newrelic_rpm'
gem 'bugsnag', '~> 6.25.2'
gem 'algoliasearch-rails', '~> 2.2.2'

gem 'turbo-rails', '~> 1.4.0'
gem 'sass-rails', '>= 6'
gem 'slim', '~> 5.1.1'
gem 'slim-rails', '~> 3.6.2'
gem 'webpacker', '~> 5.4.0'
gem 'jbuilder', '~> 2.11.5'
gem 'image_processing', '~> 1.2'
gem 'rack-cors', '~> 2.0.1'

gem 'kaminari', '~> 1.2.2'
gem 'httparty', '~> 0.21.0'
gem 'colorize', '~> 1.1.0'
gem "audited", '~> 5.4.2'

gem 'rgeo-geojson', '~> 2.1.1'

# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'differ', '~> 0.1.2'
gem "breadcrumbs_on_rails", '~> 4.1.0'
gem 'meta-tags', '~> 2.20.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry', "~> 0.14.2"
  gem 'dotenv-rails'

  # scraping
  gem 'nokogiri' #, '~> 1.11.7'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'ruby-vips' # TODO: remove after Rails 7 migration?
  gem 'sqlite3'
  gem 'parallel'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
