class ImportsController < ApplicationController
  def new
  end

  def create
    area_id = params[:import][:area_id]
    raise "please choose an area_id" unless area_id

    save = (params[:commit] == "Import")

  	data = RGeo::GeoJSON.decode(params[:import][:geojson].read)
  	problem_features = data.select{|f| f.geometry.is_a?(RGeo::Cartesian::PointImpl) }
    boulder_features = data.select{|f| f.geometry.is_a?(RGeo::Cartesian::LineStringImpl) }

  	@objects = []

    ActiveRecord::Base.transaction do
    	problem_features.each do |feature|

        if feature["problemId"].present?
        	problem = Problem.find_by(id: feature["problemId"])
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

        if feature["boulderId"].present?
          boulder = Boulder.find_by(id: feature["boulderId"])
        else
          boulder = Boulder.new(area_id: area_id)
        end

        boulder.assign_attributes(
          polygon: FACTORY.polygon(feature.geometry)
        )

        boulder.save! if save
        @objects << boulder
      end
    end
  end
end
