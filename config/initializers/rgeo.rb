# https://github.com/rgeo/activerecord-postgis-adapter#configuring-activerecord

FACTORY = RGeo::Geographic.spherical_factory(srid: 4326)

# RGeo::ActiveRecord::SpatialFactoryStore.instance.tap do |config|
#   config.default = FACTORY.projection_factory
# end