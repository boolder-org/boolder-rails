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
          name varchar(250), 
          grade varchar(10)
        );
      SQL

      # TODO: create index

      Problem.all.find_each do |p|
        db.execute(
          "INSERT INTO problems (id, name, grade)
          VALUES (?, ?, ?)", 
          [p.id, p.name, p.grade]
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