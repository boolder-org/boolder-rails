class MakeProblemSteepnessNotNull < ActiveRecord::Migration[6.0]
  def change
  	change_column_null(:problems, :steepness, false, "other")
  end
end
