class CircuitsController < ApplicationController
  def show
    @circuit = Circuit.find(params[:id])
    @problems = @circuit.problems.sort_by{|p| p.enumerable_circuit_number }
  end
end
