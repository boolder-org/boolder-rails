class Area < ApplicationRecord
  has_many :boulders
  has_many :problems
  has_many :circuits
  has_many :pois
  has_one_attached :cover

  # reindex problems on algolia when area is updated
  # https://github.com/algolia/algoliasearch-rails#propagating-the-change-from-a-nested-child
  after_save { problems.each(&:touch) } 

  include AlgoliaSearch
  algoliasearch if: :published, enqueue: true do
    attributes :name
    attribute :bounds do 
      { 
        south_west: { lat: bounds[:south_west]&.lat || 0.0, lng: bounds[:south_west]&.lon || 0.0 },
        north_east:  { lat: bounds[:north_east]&.lat || 0.0, lng: bounds[:north_east]&.lon || 0.0 },
      }
    end
    searchableAttributes [:name]
  end

  TAGS = %i(beginner_friendly train_station_closeby dry_fast)

  scope :published, -> { where(published: true) }
  include HasTagsConcern

  def start_location
    @start_location ||= pois.first&.route&.points&.last
  end

  def level_density_score
    1.upto(8).map{|level| (problems.level(level).count >= 40) ? 1 : 0 }.reduce(:+)
  end

  def to_param
    slug
  end

  def name_debug
    [id, name].join(" - ")
  end

  def bounds
    @bounds ||= {
      south_west: FACTORY.point(boulders.minimum("st_xmin(polygon::geometry)"), boulders.minimum("st_ymin(polygon::geometry)")),
      north_east: FACTORY.point(boulders.maximum("st_xmax(polygon::geometry)"), boulders.maximum("st_ymax(polygon::geometry)"))
    }
  end
end
