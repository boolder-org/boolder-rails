module PgSearchable
  extend ActiveSupport::Concern

  included do
    include PgSearch::Model

    pg_search_scope :tsearch_search,
                    against: :name,
                    ignoring: :accents,
                    using: {
                      tsearch: {
                        prefix: true
                      }
                    }

    pg_search_scope :trigram_search,
                    against: :name,
                    ignoring: :accents,
                    using: {
                      trigram: {
                        word_similarity: true,
                        threshold: 0.5
                      }
                    }

    pg_search_scope :trigram_search_low_threshold,
                    against: :name,
                    ignoring: :accents,
                    using: {
                      trigram: {
                        word_similarity: true,
                        threshold: 0.3
                      }
                    }
  end
end
