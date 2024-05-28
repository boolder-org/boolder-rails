class Boulder < ApplicationRecord
  belongs_to :area

  audited associated_with: :import
  attr_accessor :import # used by audited associated_with: :import
  include CheckConflicts
end
