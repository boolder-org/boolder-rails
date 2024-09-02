namespace :geo do
  task starts: :environment do 
    Topo.published.where(id: 3741).find_each do |topo|
      puts "Topo #{topo.id}"
      problems = topo.problems.select{|p| p.start_topo_id == topo.id && p.start_coordinates.present? }
      starts = []
      problems.each do |problem|
        if starts.include?()
        # if coordinates
        #   circuit_problem = problems.select{|p| p.circuit_number.present? }.first
        #   main_problem = circuit_problem || problems.sort_by(&:popularity).reverse.first
        # end
        # p.update_columns(start_parent_id: main_problem.id) unless p.id == main_problem.id
      end
    end

    puts "Done".green
  end

  task compute: :environment do
    Boulder.all.find_each do |boulder|
      puts "Processing boulder ##{boulder.id}"

      centroid = Boulder.where(id: boulder.id).select("ST_Centroid(polygon::geometry) as centroid").to_a.first.centroid

      problems = Problem.
        where(parent_id: nil).
        select("problems.*, degrees(ST_Azimuth('SRID=4326;#{centroid.to_s}'::geometry, location::geometry)) AS degrees").
        where("ST_Distance('SRID=4326;#{boulder.polygon.to_s}'::geometry, location::geometry) <= ?", BigDecimal("1e-06")).
        order("degrees DESC").to_a


      problems_with_children = []

      problems.each do |o|
        problems_with_children << o
        # problems_with_children.concat o.children 
      end

      problems_with_children.each_with_index do |problem, index|

        # TODO: scope by topo_id ?
        previous = problems_with_children[(index-1)%problems_with_children.length]
        nexxt = problems_with_children[(index+1)%problems_with_children.length]

        problem.update_columns(next_id: nexxt.id) if nexxt && nexxt.id != problem.id  
        problem.update_columns(previous_id: previous.id) if previous && previous.id != problem.id
      end

      # topos = problems.map(&:id).each_with_index.map{|id, index| OpenStruct.new(id: id, index: index) }
      #   .group_by{|p| Problem.find(p.id).lines.published.first&.topo_id }
      #   .map{|topo_id, problems| OpenStruct.new(topo_id: topo_id, problems: problems) }
      # # TODO: handle last elements correctly
      # # TODO: handle nil topos

      # topos.each_with_index do |topo, index|
      #   previous = topos[(index-1)%topos.length]
      #   nexxt = topos[(index+1)%topos.length]

      #   topo.problems.each do |p|
      #     problem = Problem.find(p.id)
      #     problem.update_columns(topo_previous_id: previous.problems.last&.id) if previous && previous.problems.last&.id != problem.id
      #     problem.update_columns(topo_next_id: nexxt.problems.first&.id) if nexxt && nexxt.problems.first&.id != problem.id
      #   end
      # end

      puts "Boulder ##{boulder.id}: #{problems.length} problems processed"
    end

    puts "Done".green
  end
end