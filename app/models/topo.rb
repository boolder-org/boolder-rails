class Topo < ApplicationRecord
	belongs_to :problem
	has_one_attached :photo

	default_scope { where(published: true) }

	validates :photo, presence: true
end
