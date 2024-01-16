class Import < ApplicationRecord
  has_one_attached :file
  has_associated_audits

  def infer_area_id
    problems = problem_features.map{|feature| Problem.find_by(id: feature["problemId"]) }
    boulders = boulder_features.map{|feature| Boulder.find_by(id: feature["boulderId"]) }

    ids = (problems + boulders).compact.map(&:area_id).uniq

    raise "All features must have the same area_id" if ids.count > 1
    raise "Couldn't infer area_id" if ids.count == 0
    ids.first
  end

  def applied?
    applied_at.present?
  end

  def objects_to_update
    objects = []
    area_id = infer_area_id

    problem_features.each do |feature|
      if feature["problemId"].present?
        problem = Problem.find(feature["problemId"])
      else
        raise "All problems must have a `problemId` property" 
      end

      problem.conflicting_updated_at = true if problem.location.present? && (problem.updated_at.to_s != feature["updatedAt"])

      # TODO: raise if problemId is not present but other attribute is present
      # it might be a mistake when I created the point in josm

      problem.assign_attributes(
        location: FACTORY.point(feature.geometry.x, feature.geometry.y)
      )

      objects << problem if problem.changes.any?
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
      else
        if existing_boulder = Boulder.where(polygon: polygon).first
          # raise "boulder already exists (boulder_id=#{existing_boulder.id})" 
          boulder = existing_boulder
        else
          boulder = Boulder.new(area_id: area_id)
        end
      end

      boulder.conflicting_updated_at = true if boulder.persisted? && boulder.updated_at.to_s != feature["updatedAt"]

      boulder.assign_attributes(
        polygon: polygon
      )

      objects << boulder if boulder.changes.any?
    end

    objects
  end

  private 

  def problem_features
    @problem_features ||= features.select{|f| f.geometry.geometry_type == ::RGeo::Feature::Point }
  end

  def boulder_features
    @boulder_features ||= features.select{|f| f.geometry.geometry_type == ::RGeo::Feature::LineString || f.geometry.geometry_type == ::RGeo::Feature::Polygon }
  end

  def features
    @features ||= RGeo::GeoJSON.decode(file.download).to_a
  end
end
