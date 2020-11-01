class LinesController < ApplicationController
	def edit
		@line = Line.find(params[:id])
	end

	def update
		line = Line.find(params[:id])

		coordinates = JSON.parse(params[:line][:coordinates])
		line.update(coordinates: coordinates)

		flash[:notice] = "Line updated"
		redirect_to edit_line_path(line)
	end

	def create
		line = Line.create!(line_params)
		redirect_to edit_line_path(line)
	end

	private 
	def line_params
		params.require(:line).permit(:problem_id, :topo_id)
	end
end
