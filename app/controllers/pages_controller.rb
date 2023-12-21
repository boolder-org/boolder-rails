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
    data = {
      "Rocher Canon" => [224,   230,   10873, 10869, 245,   237],
      "Cuvier Merveille" => [9074,  9071],
      "Cuvier Rempart" => [14136, 14179, 14199, 14558, 14343],
      "Cuvier Est" => [1739,  1703,  10045, 10042],
      "Bas Cuvier" => [881,   915,   914, 1032,  1088],
      "Apremont" => [5397,  5325,  1856,  1840,  1816,  1913,  2021,  2003, 2087,  2094,  11310, 11321],
      "Franchard Ermitage" => [11321], # TODO: changer 11321 en Linea
      "Franchard Cuisinière" => [2857,  2668,  2543,  2545,  2527, 7807,  7813],
      "Franchard Isatis" => [1581,  15842, 15842, 1526,  1462,  1455,  1435,  1266], # TODO: changer 15842 en Grain de Poussière
      "Franchard Hautes Plaines" => [8801,  8680],
      "Rocher de la Reine" => [13484, 13477, 13468, 13466, 13478],
      "Gros Sablons" => [13074, 12998, 13042, 13011],
      "Rocher Fin" => [5127,  5106,  5088,  5091],
      "95.2" => [3161,  3092,  3091,  3186,  2911, 2902,  2893,  2889],
      "Roche aux Sabots" => [3255,  3257,  3283,  3288,  3331,  3409,  3355],
      "91.1" => [4534,  4551,  4550],
      "Cul de Chien" => [690],
      "Rocher du Potala" => [7878,  3803,  3825,  3806],
      "Rocher Guichot" => [4787],
      "Maunoury" => [9237, 9302,  9310,  9177],
      "Éléphant" => [2214,  2315,  7756,  2352,  2357,  2295,  2287, 2320],
    }



    @areas = data.map{|area, problem_ids| [area, problem_ids.map{|id| Problem.find(id) }] }
  end
end
