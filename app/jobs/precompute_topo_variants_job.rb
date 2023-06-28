class PrecomputeTopoVariantsJob < ApplicationJob
   queue_as :default

   def perform(topo)
     # the `.processed` will force the resizing to be done in sync
     topo.photo.variant(:medium).processed 
     Rails.logger.debug "Topo ##{topo.id}: variant :medium processed"
   end
 end