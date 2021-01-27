class ProblemsController < ApplicationController
  def index
  	@area = Area.find(params[:area_id])
  	@problems = @area.problems

  	if circuit_id = params.dig(:search, :circuit_id).presence
  		@problems = @problems.where(circuit_id: circuit_id)
  		@problems = @problems.sort_by{|p| p.enumerable_circuit_number }
  	else 
  		@problems = @problems.order("grade ASC")
  	end
  end

  def show
  end
end
