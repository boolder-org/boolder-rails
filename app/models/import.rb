class Import < ApplicationRecord
  has_one_attached :file
  has_associated_audits

  def changeset
    data = RGeo::GeoJSON.decode(file.download)
    problem_features = data.select{|f| f.geometry.is_a?(RGeo::Geos::CAPIPointImpl) }
    boulder_features = data.select{|f| f.geometry.is_a?(RGeo::Geos::CAPILineStringImpl) }

    objects = []

    area_id = 1 # FIXME

    problem_features.each do |feature|
      if feature["problemId"].present?
        problem = Problem.find_by(id: feature["problemId"])
        # raise "wrong area for problem #{problem.id}: #{problem.area_id} instead of #{area_id}" if (problem.area_id != area_id.to_i)
      else
        problem = Problem.new(area_id: area_id)
      end

      # TODO: raise if problemId is not present but other attribute is present
      # it might be a mistake when I created the point in josm

      problem.assign_attributes(
        location: FACTORY.point(feature.geometry.x, feature.geometry.y)
      )

      objects << problem
    end

    boulder_features.each do |feature|
      polygon = FACTORY.polygon(feature.geometry)
      if feature["boulderId"].present?
        boulder = Boulder.find_by(id: feature["boulderId"])
        # raise "wrong area for boulder #{boulder.id}: #{boulder.area_id} instead of #{area_id}" if (boulder.area_id != area_id.to_i)
      else
        if existing_boulder = Boulder.where(polygon: polygon).first
          raise "boulder already exists (boulder_id=#{existing_boulder.id})" 
        else
          boulder = Boulder.new(area_id: area_id)
        end
      end
      boulder.assign_attributes(
        polygon: polygon
      )

      objects << boulder
    end

    objects
  end
end
