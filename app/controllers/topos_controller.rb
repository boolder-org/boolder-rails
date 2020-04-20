class ToposController < ApplicationController
	def index
		@topos = Topo.all.order(:id)
	end

	def show
		@topo = Topo.find(params[:id])
	end

	def edit
		@topo = Topo.find(params[:id])
	end

	def update
		topo = Topo.find(params[:id])

		json_line = JSON.parse(params[:topo][:line])
		topo.update(line: json_line)

		flash[:notice] = "Topo updated"
		redirect_to edit_topo_path(topo)
	end

	private
	def topo_params
		params.require(:topo).permit(:line)
	end
end
