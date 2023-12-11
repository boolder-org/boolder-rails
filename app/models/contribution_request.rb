class ContributionRequest < ApplicationRecord
  include Geolocatable
  geolocatable :location_estimated

  belongs_to :problem
  
  STATES = %w(open closed)

  validates :location_estimated, presence: true
  validates :state, inclusion: { in: STATES }
end
