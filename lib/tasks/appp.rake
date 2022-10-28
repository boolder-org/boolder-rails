namespace :appp do
  task db: :environment do
    file_name = Rails.root.join('export', "appp", "boolder.db")

    File.delete(file_name) if File.exist?(file_name)

    begin

      db = SQLite3::Database.new file_name

      # FIXME: which size is best?
      db.execute <<-SQL
        create table problems (
          id int,
          name text, 
          grade text,
          latitude real,
          longitude real,
          circuit_id int,
          circuit_number text,
          circuit_color text,
          steepness text,
          area_id int,
          bleau_info_id text,
          featured bool,
          parent_id int
        );
      SQL

      db.execute <<-SQL
        CREATE INDEX problem_idx ON problems(id);
      SQL

      db.execute <<-SQL
        CREATE INDEX problem_area_idx ON problems(area_id);
      SQL

      db.execute <<-SQL
        CREATE INDEX problem_circuit_idx ON problems(circuit_id);
      SQL

      Problem.joins(:area).where(area: { published: true }).find_each do |p|
        db.execute(
          "INSERT INTO problems (id, name, grade, latitude, longitude, circuit_id, circuit_number, circuit_color, steepness, area_id, bleau_info_id, featured, parent_id)
          VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", 
          [p.id, p.name, p.grade, p.location&.lat, p.location&.lon, p.circuit_id, p.circuit_number, p.circuit&.color, p.steepness, p.area_id, p.bleau_info_id, p.featured ? 1 : 0, p.parent_id]
        )
      end

      db.execute <<-SQL
        create table lines (
          id int,
          problem_id int,
          topo_id int,
          coordinates text
        );
      SQL

      db.execute <<-SQL
        CREATE INDEX line_idx ON lines(id);
      SQL

      db.execute <<-SQL
        CREATE INDEX line_problem_idx ON lines(problem_id);
      SQL

      db.execute <<-SQL
        CREATE INDEX line_topo_idx ON lines(topo_id);
      SQL

      Line.joins(:problem => :area).joins(:topo).where(area: { published: true }, topo: { published: true }).find_each do |l|
        db.execute(
          "INSERT INTO lines (id, problem_id, topo_id, coordinates)
          VALUES (?, ?, ?, ?)", 
          [l.id, l.problem_id, l.topo_id, l.coordinates.to_s]
        )
      end

    rescue SQLite3::Exception => e 
      puts "Exception occurred"
      puts e
    ensure
      db.close if db
    end
  end
end