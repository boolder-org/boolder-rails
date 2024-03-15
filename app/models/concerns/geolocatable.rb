module Geolocatable
  extend ActiveSupport::Concern

  # This adds convenience methods to build a POINT object for `column_name` directly
  # from `column_name_lat` and `column_name_lon` passed by parameters (eg. in a form)
  class_methods do
    def geolocatable(column_name)
      attr_accessor "#{column_name}_lat", "#{column_name}_lon"

      before_validation do
        if send("#{column_name}_lat").present? && send("#{column_name}_lon").present?
          location = RGeo::Geographic.spherical_factory(srid: 4326).point(
            send("#{column_name}_lon").gsub(',', '.').to_f,
            send("#{column_name}_lat").gsub(',', '.').to_f
          )
          send("#{column_name}=", location)
        end
      end
    end
  end
end
