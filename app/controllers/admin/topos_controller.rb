class Admin::ToposController < Admin::BaseController
  def new
    @topo = Topo.new
  end

  def create
    ActiveRecord::Base.transaction do
      topo = Topo.new(topo_params)

      if params[:topo][:ignore_metadata] == "1"
        topo.photo = params[:topo][:photo]
        topo.save!
      else
        photo = params[:topo][:photo]
        metadata = params[:topo][:metadata]
        metadata_hash = JSON.parse(metadata.read)

        if Pathname(photo.original_filename).sub_ext('').to_s != Pathname(metadata.original_filename).sub_ext('').to_s
          raise "filenames don't match"
        end

        topo.update(photo: photo)
        topo.update(metadata: metadata_hash)
        
        problems = Problem.find(metadata_hash["problem_ids"])
        problems = problems + problems.flat_map(&:variants)

        problems.uniq.each do |problem|
          Line.create(topo_id: topo.id, problem_id: problem.id)
        end
      end

      flash[:notice] = "Topo created"
      redirect_to edit_admin_topo_path(topo)
    end
  end

  def show
    set_topo
    redirect_to edit_admin_topo_path(@topo)
  end

  def edit
    set_topo
    session[:last_topo_visited] = @topo.id
  end

  def update
    set_topo

    if @topo.update(topo_params)
      flash[:notice] = "Topo updated"
      redirect_to edit_admin_topo_path(@topo)
    else
      flash[:error] = @topo.errors.full_messages.join('; ')
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    set_topo
    
    if @topo.destroy
      flash[:notice] = "Topo destroyed"
      if area = @topo.problems.first&.area
        redirect_to admin_area_problems_path(area_slug: area.slug, sector_id: "first")
      else
        redirect_to admin_areas_path
      end
    else
      flash[:error] = @topo.errors.full_messages.join('; ')
      render "edit", status: :unprocessable_entity
    end
  end

  private
  def topo_params
    params.require(:topo).permit(:published, :photo)
  end

  def set_topo
    @topo = Topo.find(params[:id])
  end
end
