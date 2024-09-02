class Problem < ApplicationRecord
  belongs_to :circuit, optional: true
  belongs_to :area
  has_many :lines, dependent: :destroy
  has_many :topos, through: :lines
  has_many :children, class_name: "Problem", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Problem", optional: true
  has_many :start_children, class_name: "Problem", foreign_key: "start_parent_id"
  belongs_to :start_parent, class_name: "Problem", optional: true
  belongs_to :bleau_problem, foreign_key: "bleau_info_id", optional: true
  has_many :contribution_requests
  has_many :contributions

  audited except: [:has_line, :ascents, :ratings, :ratings_average, :popularity, :featured], associated_with: :import
  attr_accessor :import # used by audited associated_with: :import
  include CheckConflicts

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

  normalizes :name, :circuit_number, :circuit_letter, with: -> s { s.strip.presence }

  # TODO: validate next/previous

  validates :steepness, inclusion: { in: STEEPNESS_VALUES }
  validates :grade, inclusion: { in: GRADE_VALUES }, allow_blank: true
  validates :landing, inclusion: { in: LANDING_VALUES }, allow_blank: true
  validates :bleau_info_id, uniqueness: true, allow_blank: true
  validate :validate_circuit_letter
  validates :circuit_number, uniqueness: { scope: [:circuit_letter, :circuit_id] }, allow_nil: true
  validates :circuit_letter, uniqueness: { scope: [:circuit_number, :circuit_id] }, allow_nil: true
  validates :circuit_letter, inclusion: { in: LETTERS.keys }, allow_blank: true
  validate :validate_circuit_fields
  validate :validate_parent

  Circuit::COLOR_VALUES.each do |color|
    scope color, -> { joins(:circuit).where(circuits: { color: color }) } 
  end

  scope :level, -> (i){ where("grade >= '#{i}a' AND grade < '#{i+1}a'").tap{raise unless i.in?(1..8)} }
  scope :significant_ascents, -> { where("ascents >= ?", 20) }
  scope :exclude_bis, -> { where(circuit_letter: [nil, '']) }
  scope :with_location, -> { where.not(location: nil) }
  scope :without_location, -> { where(location: nil) }
  scope :with_line, -> { where(has_line: true) }
  scope :without_line, -> { where(has_line: false) }
  scope :without_line_only, -> { where(has_line: false).with_location }
  scope :complete, -> { where(has_line: true).with_location }
  scope :incomplete, -> { where("problems.has_line = FALSE OR problems.location IS NULL") }
  scope :without_contribution_request, -> { left_joins(:contribution_requests).where(contribution_requests: { id: nil }) }

  # reindex problems on algolia when area is updated
  # https://github.com/algolia/algoliasearch-rails#propagating-the-change-from-a-nested-child
  after_touch :index!

  include AlgoliaSearch
  algoliasearch enqueue: true, disable_indexing: Rails.env.local? do
    attributes :name, :grade, :popularity
    attribute :area_name do area.name end
    attribute :published do published? end
    attribute :circuit_number do circuit_number_simplified end
    attribute :circuit_color do circuit&.color end
    attribute :_geoloc do { lat: location&.lat || 0.0, lng: location&.lon || 0.0 } end
    # TODO: implement custom attributes callback to trigger a reindex
    # https://github.com/algolia/algoliasearch-rails#custom-attribute-definition

    searchableAttributes [:name]
    attributesForFaceting [:published]
    customRanking ['desc(popularity)']
  end

  def published?
    area.published && location.present?
  end

  def to_param
    [id, name&.parameterize].compact.join("-")
  end

  # TODO: merge with variants
  def all_variants
    if parent.present?
      parent.all_variants
    else
      [self] + children
    end
  end

  def variant_index
    all_variants.find_index(self)
  end

  def next_variant
    all_variants[(variant_index + 1) % all_variants.length]
  end

  def previous_variant
    all_variants[(variant_index - 1) % all_variants.length]
  end

  def first_variant?
    variant_index == 0
  end

  def last_variant?
    variant_index == all_variants.length - 1
  end

  def start_topo_id
    lines.published.first&.topo_id
  end

  def start_coordinates
    @start_coordinates ||= lines.published.first&.coordinates&.first
  end

  def start_coordinates_rounded
    if start_coordinates = lines.published.first&.coordinates&.first
      { 
        x: (start_coordinates["x"]*100).to_i/5*5,
        y: (start_coordinates["y"]*100).to_i/5*5,
      }
    end
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

  # TODO: rename
  def next
    if circuit_number.present?
      Problem.where(circuit_id: circuit_id).where(circuit_number: (circuit_number.to_i + 1), circuit_letter: [nil, '']).first
    end
  end

  # TODO: rename
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

  
  def update_has_line
    update(has_line: lines.published.with_coordinates.any?)
  end

  private

  def validate_circuit_fields
    if circuit_number.present? != circuit_id.present?
      errors.add(:base, "Both circuit number and circuit_id must be present or absent")
    end
  end

  def validate_parent
    if parent_id && parent_id == id
      errors.add(:parent_id, "cannot be equal to problem_id")
    end

    if parent && parent.area_id != area_id
      errors.add(:parent_id, "cannot have a different area_id")
    end

    if parent && parent.parent_id
      errors.add(:parent_id, "cannot be a parent itself")
    end
  end

  def validate_circuit_letter
    return if circuit_number.blank? || circuit_number == LETTER_START
    if circuit_number.to_i < 1
      errors.add(:circuit_number, "must be a number or D (for Départ)")
    end
  end
end
