class Contribution < ApplicationRecord
  has_many_attached :photos
  belongs_to :problem
end