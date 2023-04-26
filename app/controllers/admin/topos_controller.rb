class Admin::ToposController < Admin::BaseController
  def new
    @topo = Topo.new
  end

  def create
    ActiveRecord::Base.transaction do
      topo = Topo.new(topo_params)

      if params[:topo][:ignore_metadata]
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

  def edit
    @topo = Topo.find(params[:id])
    session[:last_topo_visited] = @topo.id
  end

  def update
    topo = Topo.find(params[:id])

    metadata = JSON.parse(params[:topo][:metadata])
    topo.update(metadata: metadata)

    if photo = params[:topo][:photo]
      topo.update(photo: params[:topo][:photo])
    end

    topo.update(topo_params)

    flash[:notice] = "Topo updated"
    redirect_to edit_admin_topo_path(topo)
  end

  def destroy
    topo = Topo.find(params[:id])
    area = topo.problems.first.area
    topo.destroy!

    flash[:notice] = "Topo destroyed"
    redirect_to admin_area_problems_path(area_slug: area.slug, circuit_id: "first")
  end

  private
  def topo_params
    params.require(:topo).permit(:published)
  end
end
