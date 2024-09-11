namespace :geo do 
  task compute: :environment do
    # TODO: reset data

    Boulder.where(id: 710).find_each do |boulder|
      puts "Processing boulder ##{boulder.id}"

      centroid = Boulder.where(id: boulder.id).select("ST_Centroid(polygon::geometry) as centroid").to_a.first.centroid

      problems = Problem.
        # where(parent_id: nil).
        select("problems.*, degrees(ST_Azimuth('SRID=4326;#{centroid.to_s}'::geometry, location::geometry)) AS degrees").
        where("ST_Distance('SRID=4326;#{boulder.polygon.to_s}'::geometry, location::geometry) <= ?", BigDecimal("1e-06")).
        order("degrees DESC").to_a

      topos_with_index = problems.each_with_index.
        map{|p, i| OpenStruct.new(problem: p, index: i)  }.
        group_by{|o| o.problem.lines.published.first&.topo_id }.to_a.
        map{|topo_id, array| [topo_id, array.map(&:index).min] }.
        reject{|topo_id, index| topo_id == nil  }

      

      puts "Boulder ##{boulder.id}: #{problems.length} problems processed"
    end

    puts "Done".green
  end
end