class Problem < ApplicationRecord
  belongs_to :circuit
  belongs_to :area
  has_many :topos

  STEEPNESS_VALUES = %w(wall slab overhang roof traverse other)

  validates :steepness, inclusion: { in: STEEPNESS_VALUES }
  validates :name, allow_blank: false

  %i(yellow orange blue skyblue red white).each do |color|
  	scope color, -> { joins(:circuit).where(circuits: { color: color }) }	
  end

  def circuit_desc
		[circuit.try(:color), circuit_number].compact.join('-')
  end
end
