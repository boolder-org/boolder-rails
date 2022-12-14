class Problem < ApplicationRecord
  belongs_to :circuit, optional: true
  belongs_to :area
  has_many :lines, dependent: :destroy
  has_many :topos, through: :lines
  has_many :children, class_name: "Problem", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Problem", optional: true

  # reindex problems on algolia when area is updated
  # https://github.com/algolia/algoliasearch-rails#propagating-the-change-from-a-nested-child
  after_touch :index!

  include AlgoliaSearch
  algoliasearch if: :published?, enqueue: true do
    attributes :name, :circuit_number, :grade, :popularity
    attribute :area_name do area.name end
    attribute :circuit_color do circuit&.color end
    attribute :_geoloc do { lat: location&.lat || 0.0, lng: location&.lon || 0.0 } end
    # TODO: implement custom attributes callback to trigger a reindex
    # https://github.com/algolia/algoliasearch-rails#custom-attribute-definition

    searchableAttributes [:name]
    customRanking ['desc(popularity)']
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

  include HasTagsConcern
  scope :level, -> (i){ where("grade >= '#{i}a' AND grade < '#{i+1}a'").tap{raise unless i.in?(1..8)} }
  scope :around_level, -> (i){ where("grade >= '#{i-1}c' AND grade < '#{i+1}b'").tap{raise unless i.in?(1..8)} }
  scope :significant_ascents, -> { where("ascents >= ?", 20) }

  def published?
    area.published
  end

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

  def variants
    if parent
      [parent] + parent.children - [self]
    else
      children
    end
  end

  # # FIXME: document & test
  # def risk_score
  #   return nil unless height && landing

  #   # FIXME: use default value
  #   mapping = { "easy" => 0, "medium" => 3, "hard" => 10 }

  #   (mapping[landing] * [(height - 2), 0].max).round(1)
  # end
end
