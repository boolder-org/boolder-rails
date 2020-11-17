class ProblemsController < ApplicationController
	def index
		redirect_to problems_path(area_id: (session[:area_id] || 1), color: :yellow) if params[:area_id].blank?

		arel = Problem.all

		if params[:area_id].present?
			arel = arel.where(area_id: params[:area_id]) 
			session[:area_id] = params[:area_id]
		end

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
		extracted_params = params[:extracted]

		if extracted_params.present?
			@extracted_name = extracted_params[:name].strip
			@extracted_grade = extracted_params[:grade].strip
			@extracted_id = extracted_params[:id].strip

			if extracted_params[:tags].include?("travers")
				@extracted_steepness = :traverse
			elsif extracted_params[:tags].include?("toit")
				@extracted_steepness = :roof
			elsif extracted_params[:tags].include?("dévers") || extracted_params[:tags].include?("surplomb")
				@extracted_steepness = :overhang
			elsif extracted_params[:tags].include?("dalle")
				@extracted_steepness = :slab
			elsif extracted_params[:tags].include?("mur")
				@extracted_steepness = :wall
			else
				@extracted_steepness = :other
			end						
		end

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
		session[:area_id] = @problem.area_id
	end

	def update
		problem = Problem.find(params[:id])

		problem.assign_attributes(problem_params)
		problem.tags = params[:problem][:joined_tags].split(',')
		problem.save!

		flash[:notice] = "Problem updated"
		redirect_to problems_path(anchor: problem.id, area_id: problem.area_id, color: problem.circuit&.color || "off_circuit")
	end

	private 
	def problem_params
		params.require(:problem).
			permit(:area_id, :name, :grade, :steepness, :height, :bleau_info_id, :circuit_number, :circuit_id)
	end
end
