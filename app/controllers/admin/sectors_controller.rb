class Admin::SectorsController < Admin::BaseController
  def index
    @sectors = Sector.all.sort_by(&:average_grade)
  end

  def edit
    set_sector
  end

  def update
    set_sector
    
    if @sector.update(sector_params)
      flash[:notice] = "Sector updated"
      redirect_to edit_admin_sector_path(@sector)
    else
      flash[:error] = @sector.errors.full_messages.join('; ')
      render "edit", status: :unprocessable_entity
    end
  end

  private 
  def sector_params
    params.require(:sector).
      permit(:color, :risk)
  end

  def set_sector
    @sector = Sector.find(params[:id])
  end
end
