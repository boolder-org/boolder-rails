class Admin::ProblemImportsController < Admin::BaseController
  def create
    params[:import][:json].each do |file|
      hash = JSON.parse(file.read)
      problem = Problem.find hash["problemId"]

      problem.height = hash["height"]
      problem.steepness = hash["steepness"]
      problem.landing = hash["landingDifficulty"]
      problem.descent = hash["descentDifficulty"]

      problem.save!
    end

    flash[:notice] = "#{params[:import][:json].count} problems updated"
    redirect_to admin_problem_imports_path
  end
end
