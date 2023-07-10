namespace :todos do
  task create: :environment do
    # @add_location = @area.problems.joins(:bleau_problem). #order("ascents DESC NULLS LAST").
    #   where(location: nil)

    # ====================================================================================

    add_photo = Problem.all.
      joins("LEFT JOIN lines ON lines.problem_id = problems.id").where("lines.problem_id IS NULL")

    add_photo.find_each do |problem|
      if problem.todos.where(reason: "photo").any?
        puts "already a todo for problem ##{problem.id}"
      else
        todo = problem.todos.create!(state: "new", reason: "photo")

        puts "created a todo for problem ##{problem.id}"
      end
    end

    # ====================================================================================

    # FIXME : improve perfs

    Problem.all.find_each do |problem|
      if problem.todos.where(reason: "other").any?
        puts "already a todo for problem ##{problem.id}"
      else
        if problem.lines.published.any?{|l| l.coordinates.nil? }

          todo = problem.todos.create!(state: "new", reason: "other")

          puts "created a todo for problem ##{problem.id}"
        end
      end
    end

    # ====================================================================================

    action_needed = Problem.all.where(action_needed: true)

    action_needed.find_each do |problem|
      if problem.todos.where(reason: "other").any?
        puts "already a todo for problem ##{problem.id}"
      else
        todo = problem.todos.create!(state: "new", reason: "other")

        puts "created a todo for problem ##{problem.id}"
      end
    end

    # ====================================================================================
    
    puts "done".green
  end
end
