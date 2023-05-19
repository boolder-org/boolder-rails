require 'rgeo/geo_json'

namespace :top7a do
  task geojson: :environment do
    puts "exporting problems"

    factory = RGeo::GeoJSON::EntityFactory.instance

    # problems = Problem.joins(:area).where(area: { published: true }).
    #   significant_ascents. 
    #   where(grade: %w(7a 7a+)).
    #   order(popularity: :desc).
    #   limit(100)

    problems = Problem.where(id: [15552,15555,15553,15658,15625,15560,224,230,10873,10869,245,243,237,9074,14558,14199,14179,14136,14343,1739,1703,10045,10042,1088,915,914,881,1032,5397,5326,5325,1856,1840,1861,1816,1913,2021,2003,2094,2087,11310,2668,2857,2542,2545,2543,2527,8680,8801,7807,2542,1582,1462,1455,1579,1526,1435,13478,13484,13468,13467,13074,12998,13070,13011,13042,13040,13030,2893,2911,2902,2889,3091,3092,3161,3186,11425,6342,6344,3257,3255,3283,3288,3331,3409,4534,4551,4581,690,5091,5106,5124,5088,5127,7878,3825,3803,4787,9237,9177,9302,9345,2315,2214,7756,2352,8131,8126])

    problem_features = problems.map do |problem|
      hash = {}.with_indifferent_access
      hash.merge!(problem.slice(:grade, :circuit_number, :steepness))
      hash[:id] = problem.id
      hash[:circuit_color] = problem.circuit&.color
      hash[:circuit_id] = problem.circuit&.id

      name_fr = I18n.with_locale(:fr) { problem.name_with_fallback }
      name_en = I18n.with_locale(:en) { problem.name_with_fallback }
      hash[:name] = name_fr
      hash[:name_en] = (name_en != name_fr) ? name_en : ""

      hash.deep_transform_keys! { |key| key.camelize(:lower) }

      factory.feature(problem.location, nil, hash)
    end

    feature_collection = factory.feature_collection(
      problem_features
    )

    geo_json = RGeo::GeoJSON.encode(feature_collection)

    File.open(Rails.root.join('export', 'mapbox', "top7a.geojson"),"w") do |f|
      f.write(JSON.pretty_generate(geo_json))
    end

    puts "exported top7a.geojson".green
  end

  task topos: :environment do
    problems = Problem.where(id: [15552,15555,15553,15658,15625,15560,224,230,10873,10869,245,243,237,9074,14558,14199,14179,14136,14343,1739,1703,10045,10042,1088,915,914,881,1032,5397,5326,5325,1856,1840,1861,1816,1913,2021,2003,2094,2087,11310,2668,2857,2542,2545,2543,2527,8680,8801,7807,2542,1582,1462,1455,1579,1526,1435,13478,13484,13468,13467,13074,12998,13070,13011,13042,13040,13030,2893,2911,2902,2889,3091,3092,3161,3186,11425,6342,6344,3257,3255,3283,3288,3331,3409,4534,4551,4581,690,5091,5106,5124,5088,5127,7878,3825,3803,4787,9237,9177,9302,9345,2315,2214,7756,2352,8131,8126])

    ids = problems.map{|p| p.topos.published.first&.id }.compact.uniq

    puts ids.inspect
  end

  task areas: :environment do
    problems = Problem.where(id: [15552,15555,15553,15658,15625,15560,224,230,10873,10869,245,243,237,9074,14558,14199,14179,14136,14343,1739,1703,10045,10042,1088,915,914,881,1032,5397,5326,5325,1856,1840,1861,1816,1913,2021,2003,2094,2087,11310,2668,2857,2542,2545,2543,2527,8680,8801,7807,2542,1582,1462,1455,1579,1526,1435,13478,13484,13468,13467,13074,12998,13070,13011,13042,13040,13030,2893,2911,2902,2889,3091,3092,3161,3186,11425,6342,6344,3257,3255,3283,3288,3331,3409,4534,4551,4581,690,5091,5106,5124,5088,5127,7878,3825,3803,4787,9237,9177,9302,9345,2315,2214,7756,2352,8131,8126])

    ids = problems.map{|p| p.area_id }.compact.uniq.sort

    puts ids.inspect
  end
end