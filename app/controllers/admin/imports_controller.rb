class Admin::ImportsController < Admin::BaseController
  def new
  end

  def create
    area_id = params[:import][:area_id]
    raise "please choose an area_id" unless area_id

    save = (params[:commit] == "Import")

    data = RGeo::GeoJSON.decode(params[:import][:geojson].read)
    problem_features = data.select{|f| f.geometry.is_a?(RGeo::Geos::CAPIPointImpl) }
    boulder_features = data.select{|f| f.geometry.is_a?(RGeo::Geos::CAPILineStringImpl) }

    @objects = []

    ActiveRecord::Base.transaction do
      problem_features.each do |feature|

        if feature["problemId"].present?
          problem = Problem.find_by(id: feature["problemId"])
          raise "wrong area for problem #{problem.id}: #{problem.area_id} instead of #{area_id}" if (problem.area_id != area_id.to_i)
        else
          problem = Problem.new
        end

        problem.assign_attributes(
          area_id: area_id,
          location: FACTORY.point(feature.geometry.x, feature.geometry.y),
        )

        problem.save! if save
        @objects << problem
      end

      boulder_features.each do |feature|
        polygon = FACTORY.polygon(feature.geometry)

        if feature["boulderId"].present?
          boulder = Boulder.find_by(id: feature["boulderId"])
          raise "wrong area for boulder #{boulder.id}: #{boulder.area_id} instead of #{area_id}" if (boulder.area_id != area_id.to_i)
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

        boulder.save! if save
        @objects << boulder
      end
    end
  end
end
