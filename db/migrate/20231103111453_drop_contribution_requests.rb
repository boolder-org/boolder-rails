class DropContributionRequests < ActiveRecord::Migration[7.0]
  def change
    drop_table :contribution_requests
  end
end
