class BleauArea < ApplicationRecord
  has_one :area
  has_many :bleau_problems
end
