module Admin::Moderation::ProblemsHelper
  def percentage_color(percentage)
    if percentage >= 0.95
      "#1EB100" # green
    elsif percentage >= 0.85
      "#F7BA00" # yellow
    else
      "#FF0000" # red
    end
  end
end
