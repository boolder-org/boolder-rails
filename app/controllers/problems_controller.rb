class ProblemsController < ApplicationController
	def index
		arel = Problem.all
		arel = arel.where(area_id: params[:area_id]) if params[:area_id].present?
		arel = arel.joins(:circuit).where(circuits: { color: params[:color] }) if params[:color].present?

		@problems = arel.sort_by{|p| p.circuit_number.to_i + (p.circuit_number.include?('b') ? 0.5 : 0) }

		@circuits = Circuit.all
		@circuits = @circuits.where(area_id: params[:area_id]) if params[:area_id].present?
	end

	def edit
		@problem = Problem.find(params[:id])

		@problem.topos.build
	end

	def update
		problem = Problem.find(params[:id])

		problem.update(problem_params)

		flash[:notice] = "Problem updated"
		redirect_to problems_path(anchor: problem.id, area_id: problem.area_id, color: problem.circuit&.color)
	end

	private 
	def problem_params
		params.require(:problem).permit(:name, :grade, :steepness, :height, :circuit_number, :circuit_id, 
			topos_attributes: [:photo])
	end
end
