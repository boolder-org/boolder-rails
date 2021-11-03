class Problem < ApplicationRecord
  belongs_to :circuit, optional: true
  belongs_to :area
  has_many :lines, dependent: :destroy
  has_many :topos, through: :lines
  has_many :variants, class_name: "Problem", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Problem", optional: true

  include AlgoliaSearch
  algoliasearch do
    attributes :name
    attribute :area_name do 
      area.name
    end
    attribute :area_slug do 
      area.slug
    end
  end

  # FIXME: implement
  # https://github.com/algolia/algoliasearch-rails#custom-attribute-definition
  def area_name_changed?
  end
  def area_slug_changed?
  end

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
  LANDING_VALUES = %w(easy medium hard)
  DESCENT_VALUES = %w(easy medium hard)

  validates :steepness, inclusion: { in: STEEPNESS_VALUES }
  validates :grade, inclusion: { in: GRADE_VALUES }, allow_blank: true
  validates :landing, inclusion: { in: LANDING_VALUES }, allow_blank: true
  validates :descent, inclusion: { in: DESCENT_VALUES }, allow_blank: true

  Circuit::COLOR_VALUES.each do |color|
    scope color, -> { joins(:circuit).where(circuits: { color: color }) } 
  end

  scope :area, -> (area_id){ where(area_id: area_id) } 
  scope :number, -> (circuit_number){ where(circuit_number: circuit_number) } 
  include HasTagsConcern
  scope :level, -> (i){ where("grade >= '#{i}a' AND grade < '#{i+1}a'").tap{raise unless i.in?(1..8)} }
  scope :featured, -> { where(featured: true) }

  def to_param
    [id, name.parameterize.presence].compact.join("-")
  end

  def name_with_fallback
    if name.present?
      name
    elsif circuit_number.present? && circuit.id
      circuit.name + " " + circuit_number
    else
      I18n.t("problem.no_name")
    end 
  end

  def name_debug
    circuit_debug = nil
    if circuit_number.present? && circuit.id
      circuit_debug = [circuit.name, circuit_number.to_s].join(" ")
    end

    [circuit_debug, name].compact.join(" ")
  end

  def enumerable_circuit_number
    if circuit_number.present?
      circuit_number.to_i + (circuit_number.include?('b') ? 0.5 : 0)
    else
      1_000
    end
  end

  def next
    if circuit_number.present?
      Problem.where(circuit_id: circuit_id).where(circuit_number: (circuit_number.to_i + 1)).first
    end
  end

  def previous
    if circuit_number.present?
      Problem.where(circuit_id: circuit_id).where(circuit_number: (circuit_number.to_i - 1)).first
    end
  end

  def all_variants
    if parent
      [parent] + parent.variants - [self]
    else
      variants
    end
  end
end
