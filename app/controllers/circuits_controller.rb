class CircuitsController < ApplicationController
  def index
    @circuits = Circuit.all.sort_by{|c| c.average_grade }
  end

  def show
    @circuit = Circuit.find(params[:id])
    @area = @circuit.main_area
  end
end
