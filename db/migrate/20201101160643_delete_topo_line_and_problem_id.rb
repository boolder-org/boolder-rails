class DeleteTopoLineAndProblemId < ActiveRecord::Migration[6.0]
  def change
  	remove_column :topos, :line, :json
  	remove_column :topos, :problem_id, :int
  end
end
