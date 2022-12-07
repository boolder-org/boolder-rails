class ProblemsController < ApplicationController
  def show
    @problem = Problem.find(params[:id])
    @line = @problem.lines.published.first
  end

  def index
    @grades = %w(3a 3b 3c 4a 4b 4c 5a 5b 5c 6a 6b 6c 7a 7b 7c 8a 8b 8c 9a)

    if params[:grade].in?(@grades) 
      grade = params[:grade]
    else
      grade = "6a"
    end

    @problems = Problem.joins(:area).where(area: { published: true }).
      where("rating > 0").
      where(grade: [grade, "#{grade}+"]).
      order(rating: :desc).limit(2000)
      # where("rating > 50").where(grade: ["6a", "6a+"]).order(grade: :desc)
  end
end
