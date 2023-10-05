namespace :contribute do
  task generate: :environment do

    # ====================================================================================

    add_photo = Problem.all.
      joins("LEFT JOIN lines ON lines.problem_id = problems.id").where("lines.problem_id IS NULL")

    add_photo.find_each do |problem|
      if problem.contribution_requests.where(what: "photo").any?
        puts "already a contribution request for problem ##{problem.id}"
      else
        problem.contribution_requests.create!(state: "new", what: "photo")

        puts "created a contribution request for problem ##{problem.id}"
      end
    end

    # ====================================================================================

    # FIXME : improve perfs

    Problem.all.find_each do |problem|
      if problem.contribution_requests.where(what: "line").any?
        puts "already a contribution request for problem ##{problem.id}"
      else
        if problem.lines.published.any?{|l| l.coordinates.nil? }

          problem.contribution_requests.create!(state: "new", what: "line")

          puts "created a contribution request for problem ##{problem.id}"
        end
      end
    end

    # ====================================================================================
    
    puts "done".green
  end
end
