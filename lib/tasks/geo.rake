namespace :geo do
  task compute: :environment do
    Boulder.all.find_each do |boulder|
      centroid = Boulder.where(id: boulder.id).select("ST_Centroid(polygon::geometry) as centroid").to_a.first.centroid

      problems = Problem.
        where(parent_id: nil).
        select("problems.*, degrees(ST_Azimuth('SRID=4326;#{centroid.to_s}'::geometry, location::geometry)) AS degrees").
        where("ST_Distance('SRID=4326;#{boulder.polygon.to_s}'::geometry, location::geometry) <= ?", BigDecimal("1e-06")).
        order("degrees DESC").to_a

      size = problems.length

      problems.each_with_index do |problem, index|
        previous = problems[(index-1)%size]
        nexxt = problems[(index+1)%size]
        problem.update_columns(previous_id: previous.id) if previous && previous.id != problem.id
        problem.update_columns(next_id: nexxt.id) if nexxt && nexxt.id != problem.id

        # TODO: set columns for variants too
      end

      puts "Boulder ##{boulder.id}: #{problems.length} problems processed"
    end

    puts "Done".green
  end
end