class Problem < ApplicationRecord
  belongs_to :circuit
  belongs_to :area
  has_many :topos

  STEEPNESS_VALUES = %w(wall slab overhang roof traverse other)

  validates :steepness, inclusion: { in: STEEPNESS_VALUES }

  %i(yellow orange blue skyblue red white).each do |color|
  	scope color, -> { joins(:circuit).where(circuits: { color: color }) }	
  end

  scope :all_tags, -> (array){ where("tags @> ARRAY[?]::varchar[]", array) }
  scope :any_tags, -> (array){ where("tags && ARRAY[?]::varchar[]", array) }
end
