class Area < ApplicationRecord
  has_many :boulders
  has_many :problems
  has_many :circuits
  has_many :pois
  has_one_attached :cover

  include AlgoliaSearch
  algoliasearch if: :published, enqueue: true do
    attributes :name
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
end
