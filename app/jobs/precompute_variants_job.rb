class PrecomputeVariantsJob < ApplicationJob
  queue_as :default

  def perform(file, size)
    # the `.processed` will force the resizing to be done in sync
    file.variant(resize_to_limit: size).processed 
  end
end