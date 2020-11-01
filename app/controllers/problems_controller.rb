class ProblemsController < ApplicationController
	def index
		redirect_to problems_path(area_id: 1) if params[:area_id].blank?

		arel = Problem.all
		arel = arel.where(area_id: params[:area_id]) if params[:area_id].present?

		if params[:color] == "off_circuit"
			arel = arel.where(circuit_id: nil)
		else
			arel = arel.joins(:circuit).where(circuits: { color: params[:color] }) if params[:color].present?
		end

		@problems = arel.sort_by{|p| p.enumerable_circuit_number }

		@circuits = Circuit.all
		@circuits = @circuits.where(area_id: params[:area_id]) if params[:area_id].present?
	end

	def new
	end

	def create
		@problem = Problem.create!(problem_params)
		redirect_to @problem
	end

	def show
		problem = Problem.find(params[:id])
		redirect_to edit_problem_path(problem)
	end

	def edit
		@problem = Problem.find(params[:id])
	end

	def update
		problem = Problem.find(params[:id])

		problem.update(problem_params)

		flash[:notice] = "Problem updated"
		redirect_to problems_path(anchor: problem.id, area_id: problem.area_id, color: problem.circuit&.color)
	end

	private 
	def problem_params
		params.require(:problem).permit(:area_id, :name, :grade, :steepness, :height, :bleau_info_id, :circuit_number, :circuit_id, 
			topos_attributes: [:photo])
	end
end
