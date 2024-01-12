class Boulder < ApplicationRecord
  belongs_to :area

  attr_accessor :import # used by audited associated_with: :import
  audited associated_with: :import
  attr_accessor :conflicting_updated_at
  validates :conflicting_updated_at, absence: true
end
