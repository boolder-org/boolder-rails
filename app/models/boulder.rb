class Boulder < ApplicationRecord
  belongs_to :area

  attr_accessor :import # used by audited associated_with: :import
  audited associated_with: :import
end
