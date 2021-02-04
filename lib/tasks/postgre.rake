namespace :postgre do
  task backup: :environment do
    path = Rails.root.join('db', 'pgbackup.sql')
    `pg_dump -Fc --no-acl --no-owner boolder-dev > #{path}`
  end
end