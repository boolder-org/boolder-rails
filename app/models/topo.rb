class Topo < ApplicationRecord
	belongs_to :problem
	has_one_attached :photo

	default_scope { where(published: true) }

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
