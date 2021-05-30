class ProblemsController < ApplicationController
  def index
    @area = Area.find_by(slug: params[:slug])
    @problems = @area.problems.order("grade ASC, id ASC")

    @problems = @problems.featured if params[:featured] == "true"

    if params[:level].to_i.in?(1..8)
      @problems = @problems.level(params[:level].to_i)
    else
      params[:level] = "all"
    end

    if params[:circuit_id].present? && circuit = Circuit.find(params[:circuit_id].to_i)
      @problems = @problems.where(circuit_id: circuit.id)
    end

    @page = params[:page].presence || 1
    @problems = @problems.page(@page).per(100)
  end

  def show
    @problem = Problem.find(params[:id])
    @line = @problem.lines.published.first
  end
end
