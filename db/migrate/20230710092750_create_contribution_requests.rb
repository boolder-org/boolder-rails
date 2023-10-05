class CreateContributionRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :contribution_requests do |t|
      t.string :what, index: true, null: false
      t.string :state, index: true, null: false
      t.references :problem
      t.timestamps
    end
  end
end
