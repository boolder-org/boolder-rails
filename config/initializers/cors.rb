# CORS policy to prevent errors with Cloudfront CDN
# https://devcenter.heroku.com/articles/using-amazon-cloudfront-cdn#amazon-cloudfront

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get, :post, :patch, :put]
  end
end