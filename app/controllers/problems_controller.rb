class ProblemsController < ApplicationController
	def index
		@problems = Problem.all
	end

	def edit
		@problem = Problem.find(params[:id])
	end

	def update
		problem = Problem.find(params[:id])

		problem.update(problem_params)

		flash[:notice] = "Problem updated"
		redirect_to problems_path(anchor: problem.id)
	end

	private 
	def problem_params
		params.require(:problem).permit(:name, :grade, :steepness, :height, :circuit_number, :circuit)
	end
end
