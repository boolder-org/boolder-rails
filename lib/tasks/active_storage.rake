namespace :active_storage do
  task process_topo_variants: :environment do
    Topo.published.find_each do |topo|
      puts "Processing topo ##{topo.id}"
      topo.photo.variant(:medium).processed
    end

    puts "Done".green
  end
end