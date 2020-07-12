class ImportsController < ApplicationController
  def new
  end

  def create
    area_id = params[:import][:area_id]
    raise "please choose an area_id" unless area_id

    save = (params[:commit] == "Import")

  	data = RGeo::GeoJSON.decode(params[:import][:geojson])
  	problem_features = data.select{|f| f.geometry.is_a?(RGeo::Cartesian::PointImpl) }
    boulder_features = data.select{|f| f.geometry.is_a?(RGeo::Cartesian::PolygonImpl) }

  	@objects = []

    ActiveRecord::Base.transaction do
    	problem_features.each do |feature|

        if feature["circuitColor"].present?
          circuit = Circuit.find_or_initialize_by(color: feature["circuitColor"], area_id: area_id)
        else
          circuit = nil
        end

        if feature["id"].present?
        	problem = Problem.find_or_initialize_by(id: feature["id"])
        elsif circuit && feature["circuitNumber"].present?
        	problem = Problem.find_or_initialize_by(circuit: circuit, circuit_number: feature["circuitNumber"], area_id: area_id)
        else
        	problem = Problem.new
        end

        problem.assign_attributes(
          area_id: area_id,
        	location: FACTORY.point(feature.geometry.x, feature.geometry.y),
        	name: feature["name"].presence,
          grade: feature["grade"].presence,
          circuit_number: feature["circuitNumber"].presence,
          steepness: feature["steepness"].presence || "other",
          height: feature["height"].presence,
        )

        problem.save! if save
        @objects << problem
      end

      boulder_features.each do |feature|
        boulder = Boulder.where("ST_AsText(ST_Intersection(polygon, '#{feature.geometry.to_s}'::geometry)) != 'POLYGON EMPTY'").first

        if !boulder
          boulder = Boulder.new(area_id: area_id)
        end

        boulder.assign_attributes(
          polygon: feature.geometry.to_s
        )

        boulder.save! if save
        @objects << boulder
      end
    end
  end
end
