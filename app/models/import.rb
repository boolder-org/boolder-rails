class Import < ApplicationRecord
  has_one_attached :file
  has_associated_audits

  def objects
    problem_features = file_features.select{|f| f.geometry.geometry_type == ::RGeo::Feature::Point }
    boulder_features = file_features.select{|f| f.geometry.geometry_type == ::RGeo::Feature::LineString || f.geometry.geometry_type == ::RGeo::Feature::Polygon }

    objects = []

    area_id = 1 # FIXME

    # factory = RGeo::GeoJSON::EntityFactory.instance

    problem_features.each do |feature|
      if feature["problemId"].present?
        problem = Problem.find(feature["problemId"])
        # raise "wrong area for problem #{problem.id}: #{problem.area_id} instead of #{area_id}" if (problem.area_id != area_id.to_i)
      else
        problem = Problem.new(area_id: area_id)
      end

      # TODO: raise if problemId is not present but other attribute is present
      # it might be a mistake when I created the point in josm

      problem.assign_attributes(
        location: FACTORY.point(feature.geometry.x, feature.geometry.y)
      )

      problem.conflicting_updated_at = true if problem.updated_at.to_s != feature["updatedAt"]

      objects << problem
    end

    boulder_features.each do |feature|
      
      # some editors use LineString and some use Polygon => we need to handle both
      line_string = case feature.geometry
      when ::RGeo::Feature::LineString
        feature.geometry
      when ::RGeo::Feature::Polygon
        FACTORY.line_string(feature.geometry.exterior_ring.points)
      end

      polygon = FACTORY.polygon(line_string)

      if feature["boulderId"].present?
        boulder = Boulder.find(feature["boulderId"])
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

      boulder.conflicting_updated_at = true if boulder.updated_at.to_s != feature["updatedAt"]

      objects << boulder
    end

    objects
  end

  private 

  def file_features
    @file_features ||= RGeo::GeoJSON.decode(file.download)
  end
end
