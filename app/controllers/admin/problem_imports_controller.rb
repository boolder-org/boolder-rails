class Admin::ProblemImportsController < Admin::BaseController
  def create
    files = params[:import][:json].select{|f| f.present? }

    files.sort_by{|file| file.original_filename }.each do |file|
      hash = JSON.parse(file.read)
      problem = Problem.find hash["problemId"]

      problem.height = hash["height"]
      problem.steepness = hash["steepness"]
      problem.landing = hash["landingDifficulty"]

      problem.save!
    end

    flash[:notice] = "#{files.count} problems updated"
    redirect_to new_admin_problem_import_path
  end
end
