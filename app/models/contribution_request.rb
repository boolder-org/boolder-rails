class ContributionRequest < ApplicationRecord
  belongs_to :problem
  
  validates :location_estimated, presence: true

  include Geolocatable
  geolocatable :location_estimated
end
