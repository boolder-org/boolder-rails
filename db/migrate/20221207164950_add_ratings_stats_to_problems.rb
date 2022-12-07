class AddRatingsStatsToProblems < ActiveRecord::Migration[6.1]
  def change
    add_column :problems, :ratings_avg, :decimal
    add_column :problems, :ratings, :integer
    add_column :problems, :ascents, :integer
    add_column :problems, :popularity, :integer, index: true
  end
end
