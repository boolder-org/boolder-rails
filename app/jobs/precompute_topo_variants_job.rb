class PrecomputeTopoVariantsJob < ApplicationJob
   queue_as :default

   def perform(topo)
     # the `.processed` will force the resizing to be done in sync
     topo.photo.variant(resize_to_limit: [1200, 1200], quality: 50).processed 
     Rails.logger.debug "Topo ##{topo.id}: variant resize_to_limit: [1200, 1200], quality: 50 processed"
   end
 end