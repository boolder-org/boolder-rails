class Area < ApplicationRecord
  has_many :boulders
  has_many :problems
  has_many :circuits
  has_many :pois

  TAGS = %i(beginner_friendly train_station_closeby dry_fast less_crowded)

  scope :published, -> { where(published: true) }

  # FIXME: use concern
  scope :all_tags, -> (array){ where("tags @> ARRAY[?]::varchar[]", array) }
  scope :any_tags, -> (array){ where("tags && ARRAY[?]::varchar[]", array) }

  def start_location
    @start_location ||= pois.first&.route&.points&.last
  end

  def to_param
    slug
  end
end
