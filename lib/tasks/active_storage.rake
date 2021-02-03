namespace :active_storage do

  # # inspired by https://stackoverflow.com/questions/52684443/how-to-sync-new-activestorage-mirrors
  # desc 'Ensures all files are mirrored'
  # task mirror_all: [:environment] do

  #   if Rails.application.config.active_storage.service != :mirror
  #     raise "ERROR: set config.active_storage.service = :mirror in development.rb" 
  #   end

  #   if !Rails.env.development?
  #     raise "ERROR: this task is development only"
  #   end

  #   # Iterate through each blob
  #   ActiveStorage::Blob.all.each do |blob|

  #     # We assume the primary storage is local
  #     local_file = ActiveStorage::Blob.service.primary.path_for blob.key
  #     puts local_file

  #     # Iterate through each mirror
  #     ActiveStorage::Blob.service.mirrors.each do |mirror|
  #       # If the file doesn't exist on the mirror, upload it
  #       mirror.upload(blob.key, File.open(local_file), checksum: blob.checksum) unless mirror.exist? blob.key
  #     end
  #   end

    # task change_service_all: [:environment] do
    #   if !Rails.env.development?
    #     raise "ERROR: this task is development only"
    #   end

    #   ActiveStorage::Blob.all.each do |blob|
    #     blob.service_name = ActiveStorage::Blob.service.name
    #     blob.save!
    #   end
    # end
  end
end