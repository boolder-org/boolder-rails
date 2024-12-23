source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.3.5"

gem "rails", "~> 8.0"
gem "puma", ">= 5.0"
gem "pg"
gem "pg_search"
gem "activerecord-postgis-adapter", github: "boolder-org/activerecord-postgis-adapter", branch: "rails-8" # waiting for official Rails 8 support
gem "aws-sdk-s3"
gem "image_processing", "~> 1.2"
gem "propshaft"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
# gem "tailwindcss-ruby", "3.4.13" # pin to tailwindcss version 3.4.13
gem "bcrypt", "~> 3.1.7"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "solid_cache"
gem "solid_cable"
gem "solid_queue"
gem "mission_control-jobs"

gem "bootsnap", require: false
gem "kamal", require: false
gem "thruster", require: false

gem "rack-cors"
gem "bugsnag"
gem "kaminari"
gem "httparty"
gem "colorize"
gem "audited"
gem "ostruct" # TODO: remove
gem "rgeo-geojson", "~> 2.1.1" # TODO: update
gem "differ"
gem "breadcrumbs_on_rails"
gem "meta-tags"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
  gem "pry"
end

group :development do
  gem "web-console"
  gem "nokogiri"
end

group :test do
  gem "capybara"
end
