class Admin::ToposController < Admin::BaseController
  def new
    @topo = Topo.new
  end

  def create
    topo = Topo.new(topo_params)

    if params[:topo][:metadata].present?
      if xml_metadata = params[:topo][:metadata].read
        topo.update(metadata: Hash.from_xml(xml_metadata))
      end
    end

    if photo = params[:topo][:photo]
      topo.update(photo: params[:topo][:photo])
    end

    flash[:notice] = "Topo created"
    redirect_to edit_admin_topo_path(topo)
  end

  def edit
    @topo = Topo.find(params[:id])
    session[:last_topo_visited] = @topo.id
  end

  def update
    topo = Topo.find(params[:id])

    if params[:topo][:metadata].present?
      if xml_metadata = params[:topo][:metadata].read
        topo.update(metadata: Hash.from_xml(xml_metadata))
      end
    end

    if photo = params[:topo][:photo]
      topo.update(photo: params[:topo][:photo])
    end

    topo.update(topo_params)

    flash[:notice] = "Topo updated"
    redirect_to edit_admin_topo_path(topo)
  end

  def destroy
    topo = Topo.find(params[:id])
    
    problem = topo.problem  
    topo.delete

    flash[:notice] = "Topo deleted"
    redirect_to edit_admin_problem_path(problem)
  end

  private
  def topo_params
    params.require(:topo).permit(:published)
  end
end
