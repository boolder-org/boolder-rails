class AddProblemNameAndProblemUrltoContributions < ActiveRecord::Migration[7.0]
  def change
    add_column :contributions, :problem_name, :string
    add_column :contributions, :problem_url, :string
  end
end
