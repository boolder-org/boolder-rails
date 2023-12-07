class RemoveContributionRequestsComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :contribution_requests, :comment
  end
end
