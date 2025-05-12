namespace :geo do
  task compute: :environment do
    Topo.update_all(boulder_id: nil, position: nil)

    Boulder.all.find_each do |boulder|
      puts "Processing boulder ##{boulder.id}"

      centroid = Boulder.where(id: boulder.id).select("ST_Centroid(polygon::geometry) as centroid").to_a.first.centroid

      problems = Problem.
        # where(parent_id: nil).
        select("problems.*, degrees(ST_Azimuth('SRID=4326;#{centroid}'::geometry, location::geometry)) AS degrees").
        where("ST_Distance('SRID=4326;#{boulder.polygon}'::geometry, location::geometry) <= ?", BigDecimal("1e-06")).
        order("degrees DESC").to_a

      topos_with_index = problems.each_with_index.
        map { |p, i| OpenStruct.new(problem: p, index: i)  }.
        group_by { |o| o.problem.lines.published.first&.topo_id }.to_a.
        map { |topo_id, array| [ topo_id, array.map(&:index).min ] }.
        reject { |topo_id, index| topo_id == nil  }

      topos_with_index.each do |topo_id, index|
        Topo.find(topo_id).update_columns(boulder_id: boulder.id, position: index)
      end

      puts "Boulder ##{boulder.id}: #{problems.length} problems processed"
    end

    puts "Done".green
  end

  # task compute_line_starts: :environment do
  #   Topo.published.find_each do |topo|
  #     puts "Processing topo ##{topo.id}"

  #     topo.lines.each { |l| l.update_columns(start_id: nil) }
  #     topo.line_starts.destroy_all
  #     topo.lines.published.each do |line|
  #       # puts "Processing line ##{line.id}"

  #       existing_start = topo.line_starts.to_a.find { |start| start.start_overlaps?(line) }

  #       line.start = existing_start || topo.line_starts.create!
  #       line.save!
  #     end
  #   end

  #   puts "Done".green
  # end

  task compute_starts: :environment do
    Problem.update_all(start_id: nil)

    Topo.published.find_each do |topo|
      puts "Processing topo ##{topo.id}"

      # TODO: rewrite using merge of groups

      # TODO: take into account parent_id in the z_index
      # or better: take the problem that is the closest to the boulder's border
      topo.problems.sort_by(&:z_index).reverse.each do |problem|
        # FIXME: make sure it's not a multi-line
        start_overlapping = topo.problems.to_a.select { |p| p.start_id.nil? && p.start_overlaps?(problem) }

        start_overlapping.each { |p| p.update_columns(start_id: problem.id) }
        # FIXME: don't set start_id if it's the problem itself?

        end_overlapping = topo.problems.to_a.select { |p| p.end_id.nil? && p.end_overlaps?(problem) }

        end_overlapping.each { |p| p.update_columns(end_id: problem.id) }
      end
    end

    puts "Done".green
  end
end
