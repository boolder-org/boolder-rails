class Admin::ImportsController < Admin::BaseController
  def index
    @imports = Import.all.order(id: :desc)
  end

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

  def run
    @import = Import.find(params[:id])

    ActiveRecord::Base.transaction do
      @import.changes.each do |object|
        object.save!
      end

      @import.update!(processed: true)
    end

    flash[:success] = "Import successful"
    redirect_to admin_imports_path
  end

  private
  def import_params
    params.require(:import).permit(:processed, :file)
  end
end
