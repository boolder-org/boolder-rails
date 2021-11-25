AlgoliaSearch.configuration = { 
  application_id: Rails.application.credentials.dig(:algolia, :app_id), 
  api_key: Rails.application.credentials.dig(:algolia, :api_key) 
}