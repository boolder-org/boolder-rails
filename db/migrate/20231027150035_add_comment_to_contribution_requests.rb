class AddCommentToContributionRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :contribution_requests, :comment, :text
    add_column :contribution_requests, :location_estimated, :st_point, geographic: true, srid: 4326
  end
end
