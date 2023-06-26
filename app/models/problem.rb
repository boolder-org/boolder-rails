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
    attributes :name, :grade, :popularity
    attribute :area_name do area.name end
    attribute :circuit_number do circuit_number_simplified end
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
  LETTER_BIS = 'b'
  LETTER_TER = 't'
  LETTER_QUATER = 'q'
  LETTERS = { LETTER_BIS => "bis", LETTER_TER => "ter", LETTER_QUATER => "quater" }
  LETTER_START = 'D'

  validates :steepness, inclusion: { in: STEEPNESS_VALUES }
  validates :grade, inclusion: { in: GRADE_VALUES }, allow_blank: true
  validates :landing, inclusion: { in: LANDING_VALUES }, allow_blank: true
  validates :bleau_info_id, uniqueness: true, allow_blank: true
  validate :validate_circuit_letter_is_numeric
  validates :circuit_number, uniqueness: { scope: [:circuit_letter, :circuit_id] }, allow_blank: true
  validates :circuit_letter, uniqueness: { scope: [:circuit_number, :circuit_id] }, allow_blank: true
  validates :circuit_letter, inclusion: { in: LETTERS.keys }, allow_blank: true
  validate :validate_circuit_fields

  Circuit::COLOR_VALUES.each do |color|
    scope color, -> { joins(:circuit).where(circuits: { color: color }) } 
  end

  include HasTagsConcern
  scope :level, -> (i){ where("grade >= '#{i}a' AND grade < '#{i+1}a'").tap{raise unless i.in?(1..8)} }
  scope :significant_ascents, -> { where("ascents >= ?", 20) }
  scope :exclude_bis, -> { where(circuit_letter: [nil, '']) }
  scope :with_location, -> { where.not(location: nil) }

  def published?
    area.published
  end

  def to_param
    [id, name.parameterize.presence].compact.join("-")
  end

  def name_with_fallback
    if name.present?
      name
    elsif circuit_number == LETTER_START && circuit.id
      [circuit.name, I18n.t("problem.start")].join(" ")
    elsif circuit_number.present? && circuit.id
      [circuit.name, circuit_number.to_s, LETTERS.fetch(circuit_letter, nil)].join(" ")
    else
      I18n.t("problem.no_name")
    end 
  end

  def name_debug
    circuit_debug = nil
    if circuit_number.present? && circuit.id
      circuit_debug = [circuit.name, circuit_number.to_s, LETTERS.fetch(circuit_letter, nil)].join(" ")
    end

    [circuit_debug, name].compact.join(" ")
  end

  def circuit_number_simplified
    circuit_letter.present? ? nil : circuit_number
  end

  def circuit_id_simplified
    circuit_letter.present? ? nil : circuit&.id
  end

  def bis
    LETTERS.keys.map{|letter| Problem.where(circuit_id: circuit_id).where(circuit_number: circuit_number.to_i, circuit_letter: letter).first }.compact
  end

  def main
    Problem.where(circuit_id: circuit_id).where(circuit_number: circuit_number.to_i, circuit_letter: [nil, '']).first
  end

  def enumerable_circuit_number
    boost = { LETTER_BIS => 0.1, LETTER_TER => 0.2, LETTER_QUATER => 0.3 }
    circuit_number.to_i + boost.fetch(circuit_letter, 0)
  end

  def next
    if circuit_number.present?
      Problem.where(circuit_id: circuit_id).where(circuit_number: (circuit_number.to_i + 1), circuit_letter: [nil, '']).first
    end
  end

  def previous
    if circuit_number.present?
      if circuit_number == "1"
        Problem.where(circuit_id: circuit_id).where(circuit_number: LETTER_START).first
      else
        Problem.where(circuit_id: circuit_id).where(circuit_number: (circuit_number.to_i - 1), circuit_letter: [nil, '']).first
      end
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

  #   # FIXME: use a default value
  #   mapping = { "easy" => 0, "medium" => 3, "hard" => 10 }

  #   (mapping[landing] * [(height - 2), 0].max).round(1)
  # end

  private

  def validate_circuit_fields
    if circuit_number.present? != circuit_id.present?
      errors.add(:base, "Both circuit number and circuit_id must be present or absent")
    end
  end

  def validate_circuit_letter_is_numeric
    return if circuit_number.blank? || circuit_number == LETTER_START
    if circuit_number.to_i < 1
      errors.add(:circuit_number, "must be a number or D (for Départ)")
    end
  end
end
