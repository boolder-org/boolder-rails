class RenameRatingsAvg < ActiveRecord::Migration[6.1]
  def change
    rename_column :problems, :ratings_avg, :ratings_average
  end
end
