Bugsnag.configure do |config|
  config.api_key = Rails.application.credentials.dig(:bugsnag, :api_key) unless Rails.env.local?
end
