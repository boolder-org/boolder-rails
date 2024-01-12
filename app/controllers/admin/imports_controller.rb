class Admin::ImportsController < Admin::BaseController
  def new
    @import = Import.new
  end

  def create
    @import = Import.new(import_params)

    if @import.save
      redirect_to [:admin, @import]
    else
      flash[:error] = "Error"
      render :new
    end
  end

  def show
    @import = Import.find(params[:id])
  end

  private
  def import_params
    params.require(:import).permit(:processed, :file)
  end
end
