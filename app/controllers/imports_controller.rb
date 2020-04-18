class ImportsController < ApplicationController
  def new
  end

  def create
  	data = RGeo::GeoJSON.decode(params[:import][:geojson])
  	problem_features = data.select{|f| f.geometry.is_a?(RGeo::Cartesian::PointImpl) }

  	@objects = []

  	problem_features.each do |feature|

      if feature["circuit"].present?
        circuit = Circuit.find_or_initialize_by(color: feature["circuit"])
      else
        circuit = nil
      end

      if feature["id"].present?
      	problem = Problem.find_or_initialize_by(id: feature["id"])
      elsif circuit && feature["circuitNumber"].present?
      	problem = Problem.find_or_initialize_by(circuit: circuit, circuit_number: feature["circuitNumber"])
      else
      	problem = Problem.new
      end

      problem.assign_attributes(
      	location: FACTORY.point(feature.geometry.x, feature.geometry.y),
      	name: feature["name"],
        grade: feature["grade"],
        circuit_number: feature["circuitNumber"],
        steepness: feature["steepness"],
        height: feature["height"],
        photo_line: feature["photoLine"],
      )

      @objects << problem
    end
  end
end
