module CheckConflicts
  extend ActiveSupport::Concern

  included do
    attr_accessor :conflicting_updated_at
    validates :conflicting_updated_at, absence: true
  end
end