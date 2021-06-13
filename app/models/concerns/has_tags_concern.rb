module HasTagsConcern
  extend ActiveSupport::Concern

  included do
    scope :all_tags, -> (array){ where("tags @> ARRAY[?]::varchar[]", array) }
    scope :any_tags, -> (array){ where("tags && ARRAY[?]::varchar[]", array) }
  end
end