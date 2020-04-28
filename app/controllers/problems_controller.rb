class ProblemsController < ApplicationController
	def index
		@problems = Problem.all
	end

	def edit
		@problem = Problem.find(params[:id])
	end
end
