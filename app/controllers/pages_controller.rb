class PagesController < ApplicationController
  def app
  end

  def privacy
  end

  def about
  end

  def contribute
  end

  def megacircuit7a
    problem_ids = [
      224, 230, 10873, 10869, 245, 237, 9074, 9071, 14136, 14179,
    ]

    @areas = problem_ids.map.with_index(1) {|id, index| [Problem.find(id), index] }.
      group_by{|problem, index| problem.area }
  end
end
