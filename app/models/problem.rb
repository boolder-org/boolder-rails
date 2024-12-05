class Problem < ApplicationRecord
  include PgSearchable

  init_pg_searchable

  belongs_to :sector, optional: true
  belongs_to :area
  has_many :lines, dependent: :destroy
  has_many :topos, through: :lines
  has_many :children, class_name: "Problem", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Problem", optional: true
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

  normalizes :name, :description, :sector_number, :sector_letter, with: -> s { s.strip.presence }

  validates :steepness, inclusion: { in: STEEPNESS_VALUES }
  validates :grade, inclusion: { in: GRADE_VALUES }, allow_blank: true
  validates :landing, inclusion: { in: LANDING_VALUES }, allow_blank: true
  validate :validate_sector_letter
  validates :sector_number, uniqueness: { scope: [:sector_letter, :sector_id] }, allow_nil: true
  validates :sector_letter, uniqueness: { scope: [:sector_number, :sector_id] }, allow_nil: true
  validates :sector_letter, inclusion: { in: LETTERS.keys }, allow_blank: true
  validate :validate_sector_fields
  validate :validate_parent

  Sector::COLOR_VALUES.each do |color|
    scope color, -> { joins(:sector).where(sectors: { color: color }) } 
  end

  scope :level, -> (i){ where("grade >= '#{i}a' AND grade < '#{i+1}a'").tap{raise unless i.in?(1..8)} }
  scope :significant_ascents, -> { where("ascents >= ?", 20) }
  scope :exclude_bis, -> { where(sector_letter: [nil, '']) }
  scope :with_location, -> { where.not(location: nil) }
  scope :without_location, -> { where(location: nil) }
  scope :with_line, -> { where(has_line: true) }
  scope :without_line, -> { where(has_line: false) }
  scope :without_line_only, -> { where(has_line: false).with_location }
  scope :complete, -> { where(has_line: true).with_location }
  scope :incomplete, -> { where("problems.has_line = FALSE OR problems.location IS NULL") }
  scope :without_contribution_request, -> { left_joins(:contribution_requests).where(contribution_requests: { id: nil }) }
  scope :with_unpublished, ->(include_unpublished = false) { include_unpublished ? all : joins(:area).where(areas: { published: true }).where.not(location: nil) }

  def geolocation
    { lat: location&.lat || 0.0, lng: location&.lon || 0.0 }
  end

  def area_name
    area.name
  end

  def published?
    area.published && location.present?
  end

  def to_param
    [id, name&.parameterize].compact.join("-")
  end

  def name_with_fallback
    if name.present?
      name
    elsif sector_number == LETTER_START && sector.id
      [sector.name, I18n.t("problem.start")].join(" ")
    elsif sector_number.present? && sector.id
      [sector.name, sector_number.to_s, LETTERS.fetch(sector_letter, nil)].join(" ")
    else
      I18n.t("problem.no_name")
    end 
  end

  def name_debug
    sector_debug = nil
    if sector_number.present? && sector.id
      sector_debug = [sector.name, sector_number.to_s, LETTERS.fetch(sector_letter, nil)].join(" ")
    end

    [sector_debug, name].compact.join(" ")
  end


  def problem_number_simplified
    id
  end

  def problem_color
    if grade.start_with?("5")
      "green"
    elsif grade.start_with?("6")
      "blue"
    elsif grade.start_with?("7")
      "red"
    elsif grade.start_with?("8")
      "black"
    else
      "yellow"
    end
  end

  def sector_id_simplified
    sector_letter.present? ? nil : sector&.id
  end

  def bis
    LETTERS.keys.map{|letter| Problem.where(sector_id: sector_id).where(sector_number: sector_number.to_i, sector_letter: letter).first }.compact
  end

  def main
    Problem.where(sector_id: sector_id).where(sector_number: sector_number.to_i, sector_letter: [nil, '']).first
  end

  def enumerable_sector_number
    boost = { LETTER_BIS => 0.1, LETTER_TER => 0.2, LETTER_QUATER => 0.3 }
    sector_number.to_i + boost.fetch(sector_letter, 0)
  end

  def next
    if sector_number.present?
      Problem.where(sector_id: sector_id).where(sector_number: (sector_number.to_i + 1), sector_letter: [nil, '']).first
    end
  end

  def previous
    if sector_number.present?
      if sector_number == "1"
        Problem.where(sector_id: sector_id).where(sector_number: LETTER_START).first
      else
        Problem.where(sector_id: sector_id).where(sector_number: (sector_number.to_i - 1), sector_letter: [nil, '']).first
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

  def validate_sector_fields
    if sector_number.present? != sector_id.present?
      errors.add(:base, "Both sector number and sector_id must be present or absent")
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

  def validate_sector_letter
    return if sector_number.blank? || sector_number == LETTER_START
    if sector_number.to_i < 1
      errors.add(:sector_number, "must be a number or D (for Départ)")
    end
  end
end
