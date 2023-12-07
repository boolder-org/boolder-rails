module Geolocatable
  extend ActiveSupport::Concern

  class_methods do
    def geolocatable(column_name)
      attr_accessor "#{column_name}_lat", "#{column_name}_lon"

      before_validation do
        if send("#{column_name}_lat").present? && send("#{column_name}_lon").present?
          location = RGeo::Geographic.spherical_factory(srid: 4326).point(
            send("#{column_name}_lon").to_f,
            send("#{column_name}_lat").to_f
          )
          send("#{column_name}=", location)
        end
      end
    end
  end
end
