require 'vips'

namespace :app do
  task db: :environment do
    file_name = Rails.root.join('export', "appp", "boolder.db")

    File.delete(file_name) if File.exist?(file_name)

    begin

      db = SQLite3::Database.new file_name

      # FIXME: put a size on columns?
      # TODO: set not null columns?
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
          sit_start bool,
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
          "INSERT INTO problems (id, name, grade, latitude, longitude, circuit_id, circuit_number, 
          circuit_color, steepness, sit_start, area_id, bleau_info_id, 
          featured, parent_id)
          VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", 
          [p.id, p.name.presence, p.grade, p.location&.lat, p.location&.lon, p.circuit_id, p.circuit_number, 
            p.circuit&.color, p.steepness, p.tags.include?("sit_start") ? 1 : 0, p.area_id, p.bleau_info_id, 
            p.featured ? 1 : 0, p.parent_id]
        )
      end

      db.execute <<-SQL
        create table areas (
          id int,
          name text,
          south_west_lat real,
          south_west_lon real,
          north_east_lat real,
          north_east_lon real
        );
      SQL

      db.execute <<-SQL
        CREATE INDEX area_idx ON areas(id);
      SQL

      Area.published.each do |a|
        db.execute(
          "INSERT INTO areas (id, name, south_west_lat, south_west_lon, north_east_lat, north_east_lon)
          VALUES (?, ?, ?, ?, ?, ?)", 
          [a.id, a.name.presence, a.bounds[:south_west]&.lat, a.bounds[:south_west]&.lon, a.bounds[:north_east]&.lat, a.bounds[:north_east]&.lon]
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
          [l.id, l.problem_id, l.topo_id, l.coordinates.to_json]
        )
      end

      puts "exported boolder.db".green

    rescue SQLite3::Exception => e 
      puts "Exception occurred".red
      puts e
    ensure
      db.close if db
    end
  end

  task topos: :environment do
    area_id = ENV["area_id"]
    raise "please specify an area_id" unless area_id.present?

    puts "exporting area #{area_id}"

    Line.published.joins(:problem).where(problems: { area_id: area_id }).each do |line|
      puts "processing photo for line ##{line.id}"
      output_file = Rails.root.join('export', 'app', "topos", "area-#{area_id}", "topo-#{line.topo.id}.jpg").to_s

      if File.exist?(output_file)
        puts "topo-#{line.topo.id}.jpg already exists"
      else
        # FIXME: iterate on topos (not lines) to avoid double processing
        line.topo.photo.open do |file| 
          im = Vips::Image.new_from_file file.path.to_s
          im.thumbnail_image(800).write_to_file output_file
        end

        puts "created topo-#{line.topo.id}.jpg".green
      end
    end
  end

# task covers: :environment do
#   Area.order(:id).all.each do |area|
#     puts "processing area ##{area.id}"

#     output_file = Rails.root.join('export', 'app', "area-covers", "area-cover-#{area.id}.jpg").to_s
#     area.cover.open do |file| 
#       im = Vips::Image.new_from_file file.path.to_s
#       im.thumbnail_image(400).write_to_file output_file
#     end
#   end

#   puts "exported covers".green
# end
end