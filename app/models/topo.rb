class Topo < ApplicationRecord
	belongs_to :problem
	has_one_attached :photo
end
