class Topo < ApplicationRecord
  has_one_attached :photo do |attachable|
    attachable.variant :medium, resize_to_fill: [1200, 900], saver: { quality: 50, strip: true, interlace: true }, preprocessed: true
  end

  has_many :lines, dependent: :destroy
  has_many :problems, through: :lines

  audited

  scope :published, -> { where(published: true) }

  validates :photo, presence: true

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
