class ToposController < ApplicationController
	def index
		@topos = Topo.all.order(:id)
	end

	def show
		@topo = Topo.find(params[:id])
	end
end
