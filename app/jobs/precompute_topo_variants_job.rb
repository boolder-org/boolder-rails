class PrecomputeTopoVariantsJob < ApplicationJob
  queue_as :default

  def perform(topo)
    Topo::VARIANTS.each do |size|
      # the `.processed` will force the resizing to be done in sync
      topo.photo.variant(resize_to_limit: size).processed 
      Rails.logger.debug "variant #{size} processed"
    end
  end
end