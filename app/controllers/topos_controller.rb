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

		if params[:topo][:metadata].present?
			if xml_metadata = params[:topo][:metadata].read
				topo.update(metadata: Hash.from_xml(xml_metadata))
			end
		end

		if photo = params[:topo][:photo]
			topo.update(photo: params[:topo][:photo])
		end

		flash[:notice] = "Topo updated"
		redirect_to edit_topo_path(topo)
	end

	def destroy
		topo = Topo.find(params[:id])
		
		problem = topo.problem	
		topo.delete

		flash[:notice] = "Topo deleted"
		redirect_to edit_problem_path(problem)
	end
end
