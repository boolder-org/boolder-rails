module Admin::Moderation::ProblemsHelper
  def percentage_color(percentage)
    if percentage < 0.8
      "#FF0000" # red
    elsif percentage < 0.90
      "#F7BA00" # yellow
    elsif percentage < 0.95
      "#FF9400" # orange
    else
      "#1EB100" # green
    end
  end
end
