namespace :postgre do
  task backup: :environment do
  	path = Rails.root.join('db', 'pgbackup.sql')
  	`pg_dump boolder-dev > #{path}`
  end
end