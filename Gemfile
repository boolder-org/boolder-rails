source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'rails', '~> 6.1.1'
gem 'bootsnap', '>= 1.4.2', require: false

gem 'puma', '~> 4.1'
gem 'pg', '~> 1.2.3'
gem 'rails_12factor', '~> 0.0.3', group: :production
gem 'activerecord-postgis-adapter', '~> 6.0.1'

gem 'turbo-rails', '~> 0.5.8'
gem 'sass-rails', '>= 6'
gem 'slim', '~> 4.0.1'
gem 'slim-rails', '~> 3.2.0'
gem "webpacker", github: "rails/webpacker", ref: 'b6c2180' # upgrade webpacker when postcss8 works (https://davidteren.medium.com/tailwindcss-2-0-with-rails-6-1-postcss-8-0-9645e235892d)
gem 'jbuilder', '~> 2.7'
gem 'image_processing', '~> 1.2'

gem 'kaminari', '~> 1.2.1'

gem 'rgeo-geojson', '~> 2.1.1'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

gem 'differ', '~> 0.1.2'
gem "breadcrumbs_on_rails", '~> 4.0.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry', '~> 0.13.1'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'jwt', '~> 2.2.2'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
