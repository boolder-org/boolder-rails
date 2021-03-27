class Admin::ToposController < Admin::BaseController
  def new
    @topo = Topo.new
  end

  def create
    ActiveRecord::Base.transaction do
      topo = Topo.new(topo_params)

      photo = params[:topo][:photo]
      metadata = params[:topo][:metadata]
      metadata_hash = JSON.parse(metadata.read)

      if Pathname(photo.original_filename).sub_ext('').to_s != Pathname(metadata.original_filename).sub_ext('').to_s
        raise "filenames don't match"
      end

      topo.update(photo: photo)
      topo.update(metadata: metadata_hash)
      
      metadata_hash["problem_ids"].uniq.each do |problem_id|
        Line.create(topo_id: topo.id, problem_id: problem_id)
      end
      
      PrecomputeTopoVariantsJob.perform_later(topo)

      flash[:notice] = "Topo created"
      redirect_to edit_admin_topo_path(topo)
    end
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
