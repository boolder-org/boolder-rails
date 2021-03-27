class PrecomputeTopoVariantsJob < ApplicationJob
  queue_as :default

  def perform(topo, size)
    # the `.processed` will force the resizing to be done in sync
    topo.photo.variant(resize_to_limit: size).processed 
  end
end