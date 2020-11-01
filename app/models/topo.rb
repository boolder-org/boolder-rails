class Topo < ApplicationRecord
	self.ignored_columns = %w(line problem_id) # FIXME: remove once migration is done

	has_one_attached :photo
	has_many :lines
	has_many :problems, through: :lines

	scope :published, -> { where(published: true) }

	validates :photo, presence: true

	def location_from_metadata
		FACTORY.point(
			metadata_main_fields["GPSLongitude"], 
			metadata_main_fields["GPSLatitude"]
		)
	end

	def location_positioning_error_from_metadata
		metadata_main_fields["GPSHPositioningError"]
	end

	private
	def metadata_main_fields
		@metadata_main_fields ||= metadata["xmpmeta"]["RDF"]["Description"] rescue {}
	end
end
