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
      224,   230,   10873, 10869, 245,   237,   9074,  9071, 14136, 14179,
      14199, 14558, 14343, 1739,  1703,  10045, 10042, 881,  915,   914,
      1032,  1088,  5397,  5325,  1856,  1840,  1816,  1913, 2021,  2003,
      2087,  2094,  11310, 11321, 11321, 2857,  2668,  2543, 2545,  2527, # TODO: changer 11321 en Linea
      7807,  7813,  1581,  15842, 15842, 1526,  1462,  1455, 1435,  1266, # TODO: changer 15842 en Grain de Poussière, changer pilier légendaire 6c+ ?
    ]

    @areas = problem_ids.map.with_index(1) {|id, index| [Problem.find(id), index] }.
      group_by{|problem, index| problem.area }
  end
end
