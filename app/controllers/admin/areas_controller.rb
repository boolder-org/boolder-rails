class Admin::AreasController < Admin::BaseController
  def index
    sort = params[:sort] == "id" ? :id : :name
    @areas = Area.order(sort)
  end

  def edit
    @area = Area.find_by(slug: params[:slug])
  end

  def show
    @area = Area.find_by(slug: params[:slug])
    redirect_to admin_area_problems_path(@area, circuit_id: 'first')
  end

  def update
    area = Area.find_by(slug: params[:slug])
    
    area.assign_attributes(area_params)
    area.tags = params[:area][:joined_tags].split(',')

    if cover = params[:area][:cover]
      area.cover = params[:area][:cover]
    end
    area.save!

    flash[:notice] = "Area updated"
    redirect_to edit_admin_area_path(area)
  end

  private 
  def area_params
    params.require(:area).
      permit(:name, :slug, :published, :tags, :priority, :short_name)
  end
end
