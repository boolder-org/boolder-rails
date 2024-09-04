module PgSearchable
  extend ActiveSupport::Concern

  included do
    include PgSearch::Model
  end

  class_methods do
    def init_pg_searchable(options = {})
      trigram_threshold = options.fetch(:trigram_threshold, 0.5)
      trigram_low_threshold = options.fetch(:trigram_low_threshold, 0.3)

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
                          threshold: trigram_threshold
                        }
                      }

      pg_search_scope :trigram_search_low_threshold,
                      against: :name,
                      ignoring: :accents,
                      using: {
                        trigram: {
                          word_similarity: true,
                          threshold: trigram_low_threshold
                        }
                      }
    end
  end
end
