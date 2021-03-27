class Topo < ApplicationRecord
  has_one_attached :photo
  has_many :lines
  has_many :problems, through: :lines

  scope :published, -> { where(published: true) }

  validates :photo, presence: true

  VARIANTS = [
    [400,400],
    [800,800],
  ]

  def metadata_latitude
    metadata["latitude"] 
  end

  def metadata_longitude
    metadata["longitude"] 
  end

  def metadata_horizontal_accuracy
    metadata["horizontalAccuracy"] 
  end

  def metadata_heading
    metadata["heading"] 
  end
end
