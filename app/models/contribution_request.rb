class ContributionRequest < ApplicationRecord
  belongs_to :problem
  
  validates :location_estimated, presence: true
end
