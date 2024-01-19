Rails.application.config.active_storage.resolve_model_to_route = :rails_storage_proxy

# quick hack to have read-only access for files stored on prod bucket
S3_READONLY_KEY = "AKIA6FMTWZ62M437JUUM"
S3_READONLY_SECRET = "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"