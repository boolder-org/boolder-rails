class LineStart < ApplicationRecord
  belongs_to :topo
  has_many :lines, foreign_key: :start_id
end
