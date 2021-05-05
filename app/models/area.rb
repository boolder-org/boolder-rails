class Area < ApplicationRecord
  has_many :boulders
  has_many :problems
  has_many :circuits
  has_many :pois

  scope :published, -> { where(published: true) }

  def start_location
    @start_location ||= pois.first&.route&.points&.last
  end
end
