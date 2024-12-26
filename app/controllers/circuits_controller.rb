class CircuitsController < ApplicationController
  def index
    @circuits = Circuit.all.select { |c| c.problems.any? }.sort_by(&:average_grade)
  end

  def show
    @circuit = Circuit.find(params[:id])
    redirect_to circuits_path unless @circuit.problems.any?

    @area = @circuit.main_area
  end
end
