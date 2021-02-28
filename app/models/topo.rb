class Topo < ApplicationRecord
  has_one_attached :photo
  has_many :lines
  has_many :problems, through: :lines

  scope :published, -> { where(published: true) }

  validates :photo, presence: true

  def location_from_metadata
    FACTORY.point(
      metadata["longitude"], 
      metadata["latitude"] 
    )
  end

  def location_positioning_error_from_metadata
    metadata["horizontalAccuracy"]
  end
end
