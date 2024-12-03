namespace :dev do
  task dump: :environment do
    raise 'You cannot run this in production' unless Rails.env.local?

    db = "dump-prod"
    schema_file = "schema_dump.sql"
    data_file = "data_dump.sql"
    combined_file = "dump-prod.sql"

    `pg_dump -d #{db} --schema-only > db/#{schema_file}`

    `pg_dump -d #{db} --data-only \
    -t areas \
    -t problems \
    -t boulders \
    -t sectors \
    -t topos \
    -t lines \
    -t pois \
    -t poi_routes \
    -t bleau_areas \
    -t bleau_problems \
    -t contribution_requests \
    -t active_storage_attachments \
    -t active_storage_blobs \
    -t active_storage_variant_records \
    -t schema_migrations \
    > db/#{data_file}`

    `cat db/#{schema_file} db/#{data_file} > db/#{combined_file}`

    `rm db/#{schema_file}`
    `rm db/#{data_file}`

    puts "Dump done".green
  end
end