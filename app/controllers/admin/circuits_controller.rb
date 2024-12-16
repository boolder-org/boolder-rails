class Admin::CircuitsController < Admin::BaseController
  def index
    @circuits = Circuit.all.sort_by(&:average_grade)
  end

  def edit
    set_circuit
  end

  def update
    set_circuit

    if @circuit.update(circuit_params)
      flash[:notice] = "Circuit updated"
      redirect_to edit_admin_circuit_path(@circuit)
    else
      flash[:error] = @circuit.errors.full_messages.join("; ")
      render "edit", status: :unprocessable_entity
    end
  end

  private
  def circuit_params
    params.require(:circuit).
      permit(:color, :risk)
  end

  def set_circuit
    @circuit = Circuit.find(params[:id])
  end
end
