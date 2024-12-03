class ProblemsController < ApplicationController
  def show
    @problem = Problem.find(params[:id])
    @line = @problem.lines.published.first
  end

  def index
    @grades = {
      '3a'  => %w(3a 3a+),
      '3b'  => %w(3b 3b+),
      '3c'  => %w(3c 3c+),
      '4a'  => %w(4a 4a+),
      '4b'  => %w(4b 4b+),
      '4c'  => %w(4c 4c+),
      '5a'  => %w(5a 5a+),
      '5b'  => %w(5b 5b+),
      '5c'  => %w(5c 5c+),
      '6a'  => %w(6a),
      '6a+' => %w(6a+),
      '6b'  => %w(6b),
      '6b+' => %w(6b+),
      '6c'  => %w(6c),
      '6c+' => %w(6c+),
      '7a'  => %w(7a),
      '7a+' => %w(7a+),
      '7b'  => %w(7b),
      '7b+' => %w(7b+),
      '7c'  => %w(7c),
      '7c+' => %w(7c+),
      '8a'  => %w(8a),
      '8a+' => %w(8a+),
      '8b'  => %w(8b),
      '8b+' => %w(8b+),
      '8c'  => %w(8c),
      '8c+' => %w(8c+),
    }

    if params[:grade].in?(@grades.keys)
      @grade = params[:grade]
    else
      @grade = '6a'
    end

    @problems = Problem.joins(:area).where(area: { published: true }).
      significant_ascents. 
      where(grade: @grades[@grade]).
      order(name: :desc).
      limit(100)
  end
end
