class Area < ApplicationRecord
  include PgSearchable

  init_pg_searchable trigram_threshold: 0.5, trigram_low_threshold: 0.45

  has_many :boulders
  has_many :problems
  has_many :sectors, -> { distinct }, through: :problems
  has_many :poi_routes

  has_one_attached :cover do |attachable|
    attachable.variant :thumb, resize_to_limit: [400, 400], saver: { quality: 80, strip: true, interlace: true }, preprocessed: true
    attachable.variant :medium, resize_to_limit: [800, 800], saver: { quality: 80, strip: true, interlace: true }, preprocessed: true
  end

  audited

  scope :published, -> { where(published: true) }
  include HasTagsConcern

  normalizes :name, :short_name, :description_en, :warning_en, with: -> s { s.strip.presence }

  validates :tags, array: { inclusion: { in: %w(popular beginner_friendly family_friendly dry_fast) } }
  validates :slug, presence: true

  
  def levels
    @levels ||= 1.upto(8).map{|level| [level, problems.with_location.level(level).count >= 20] }.to_h
  end
  
  def self.beginner_friendly
    published.any_tags(:beginner_friendly).
    map {|area| [area, area.problems.with_location.count]}.sort{|a,b| b.second <=> a.second }.map(&:first).
    sort_by{|a| -a.sectors.select(&:beginner_friendly?).length }
  end
  
  def self.with_ids_keep_order(ids)
    where(id: ids).sort_by{|a| ids.index(a.id)}
  end
  
  def to_param
    slug
  end
  
  def name_debug
    [id, name].join(" - ")
  end
  
  def bounds
    relevant_boulders = boulders.where(ignore_for_area_hull: false)
    @bounds ||= {
      south_west: FACTORY.point(relevant_boulders.minimum("st_xmin(polygon::geometry)"), relevant_boulders.minimum("st_ymin(polygon::geometry)")),
      north_east: FACTORY.point(relevant_boulders.maximum("st_xmax(polygon::geometry)"), relevant_boulders.maximum("st_ymax(polygon::geometry)"))
    }
  end

  def serialized_bounds
    {
      south_west: { lat: bounds[:south_west]&.lat || 0.0, lng: bounds[:south_west]&.lon || 0.0 },
      north_east: { lat: bounds[:north_east]&.lat || 0.0, lng: bounds[:north_east]&.lon || 0.0 },
    }
  end

  # TODO: rewrite in SQL
  def main_sectors
    sectors.select{|c| c.problems.where(area_id: id).count >= 10 }.sort_by(&:average_grade)
  end

  def sorted_sectors
    sectors.sort_by(&:average_grade)
  end

  def download_size
    topos_count.to_f * 0.15
  end

  def topos_count
    Topo.published.joins(:lines => :problem).where(problems: { area_id: id }).uniq.count
  end
end
