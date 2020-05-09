class Area < ApplicationRecord
	has_many :boulders
	has_many :problems
	has_many :circuits
	has_many :pois
end
