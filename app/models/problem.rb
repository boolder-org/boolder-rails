class Problem < ApplicationRecord
  belongs_to :circuit, optional: true
  belongs_to :area
  has_many :lines
  has_many :topos, through: :lines

  STEEPNESS_VALUES = %w(wall slab overhang roof traverse other)

  validates :steepness, inclusion: { in: STEEPNESS_VALUES }

  %i(yellow orange blue skyblue red white).each do |color|
  	scope color, -> { joins(:circuit).where(circuits: { color: color }) }	
  end

  scope :area, -> (area_id){ where(area_id: area_id) } 
  scope :number, -> (circuit_number){ where(circuit_number: circuit_number) } 

  scope :all_tags, -> (array){ where("tags @> ARRAY[?]::varchar[]", array) }
  scope :any_tags, -> (array){ where("tags && ARRAY[?]::varchar[]", array) }

  def enumerable_circuit_number
    if circuit_number.present?
      circuit_number.to_i + (circuit_number.include?('b') ? 0.5 : 0)
    else
      1_000
    end
  end
end
