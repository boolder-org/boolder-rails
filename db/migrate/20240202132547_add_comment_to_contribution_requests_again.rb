class AddCommentToContributionRequestsAgain < ActiveRecord::Migration[7.1]
  def change
    add_column :contribution_requests, :comment, :text
  end
end
