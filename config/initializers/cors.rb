# CORS policy to prevent errors with Cloudfront CDN
# https://devcenter.heroku.com/articles/using-amazon-cloudfront-cdn#amazon-cloudfront

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ['boolder.com', 'www.boolder.com']
    resource '*', headers: :any, methods: [:get, :head, :options]
  end
end