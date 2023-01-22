source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'

gem 'rails', '~> 7.0'
gem 'bootsnap', '~> 1.15.0', require: false

gem 'puma', '~> 6.0.2'
gem 'pg','~> 1.4.5'
gem 'rails_12factor', '~> 0.0.3', group: :production
gem 'activerecord-postgis-adapter', '~> 8.0.1'
gem 'aws-sdk-s3', '~> 1.118.0'
gem 'sidekiq', '~> 7.0.3'
gem 'redis', '~> 5.0.6'
gem 'newrelic_rpm'
gem 'bugsnag', '~> 6.25.1'
gem 'algoliasearch-rails', '~> 2.2.1'

gem 'turbo-rails', '~> 1.3.2'
gem 'sass-rails', '>= 6'
gem 'slim', '~> 4.1.0'
gem 'slim-rails', '~> 3.5.1'
gem 'webpacker', '~> 5.4.0'
gem 'jbuilder', '~> 2.7'
gem 'image_processing', '~> 1.2'
gem 'rack-cors', '~> 1.1.1'
gem 'imgix-rails', '~> 4.3.0'

gem 'kaminari', '~> 1.2.1'

gem 'rgeo-geojson', '~> 2.1.1'

# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'differ', '~> 0.1.2'
gem "breadcrumbs_on_rails", '~> 4.1.0'
gem 'meta-tags', '~> 2.18.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry', "~> 0.14.2"

  # scraping
  gem 'nokogiri', '~> 1.14.0'
  gem 'httparty', '~> 0.21.0'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.1.0'
  gem 'ruby-vips'
  gem 'colorize', '~> 0.8.1'
  gem 'sqlite3'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
