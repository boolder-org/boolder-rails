class Area < ApplicationRecord
	has_many :problems
	has_many :circuits
end
