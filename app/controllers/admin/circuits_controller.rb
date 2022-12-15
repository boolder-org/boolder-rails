class Admin::CircuitsController < Admin::BaseController
  def index
    @circuits = Circuit.all.sort_by(&:average_grade)
  end

  def edit
    @circuit = Circuit.find(params[:id])
  end

  def update
    circuit = Circuit.find(params[:id])
    
    circuit.update(circuit_params)

    flash[:notice] = "Circuit updated"
    redirect_to edit_admin_circuit_path(circuit)
  end

  private 
  def circuit_params
    params.require(:circuit).
      permit(:color, :order, :risk)
  end
end
