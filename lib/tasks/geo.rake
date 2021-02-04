namespace :geo do
  
  task stats: :environment do
    area_id = ENV["area_id"]
    raise "please specify an area_id" unless area_id.present?

    puts %w(problem_id circuit_color circuit_number distance error).join ";"

    Problem.where(area_id: area_id).map do |p|  
      distance = p.topos.first&.location_from_metadata&.distance(p.location) || '-1'

      puts [p.id, p.circuit.color, p.circuit_number, distance, p.topos.first&.location_positioning_error_from_metadata].join(";")
    end
  end
end