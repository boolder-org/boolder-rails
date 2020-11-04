class Problem < ApplicationRecord
  belongs_to :circuit, optional: true
  belongs_to :area
  has_many :lines
  has_many :topos, through: :lines

  STEEPNESS_VALUES = %w(wall slab overhang roof traverse other)
  GRADE_VALUES = %w(
    1a 1a+ 1b 1b+ 1c 1c+ 
    2a 2a+ 2b 2b+ 2c 2c+ 
    3a 3a+ 3b 3b+ 3c 3c+ 
    4a 4a+ 4b 4b+ 4c 4c+ 
    5a 5a+ 5b 5b+ 5c 5c+ 
    6a 6a+ 6b 6b+ 6c 6c+ 
    7a 7a+ 7b 7b+ 7c 7c+ 
    8a 8a+ 8b 8b+ 8c 8c+ 
    9a 9a+ 9b 9b+ 9c 9c+
  )

  validates :steepness, inclusion: { in: STEEPNESS_VALUES }
  validates :grade, inclusion: { in: GRADE_VALUES }, allow_blank: true

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
