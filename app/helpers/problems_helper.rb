module ProblemsHelper
  def circle_view(problem)
    content_tag(:span, problem.circuit_number.presence || "&nbsp;".html_safe, 
      style: "background: #{uicolor(problem.circuit&.color)}; color: #{text_color(problem.circuit&.color)}",
      class: "rounded-full h-6 w-6 inline-flex leading-6 justify-center")
  end

  def circle_view_with_name(problem)
    circle_view(problem) + 
      (link_to problem.name_with_fallback, edit_admin_problem_path(problem), class: "ml-2 font-semibold")
  end

  # FIXME: make it DRY
  def circuit_circle_view(circuit)
    content_tag(:span, "&nbsp;".html_safe, 
      style: "background: #{uicolor(circuit&.color)}; color: #{text_color(circuit&.color)}",
      class: "rounded-full h-6 w-6 inline-flex leading-6 justify-center")
  end

  def uicolor(circuit_color)
    color_mapping[circuit_color] || "rgb(80% 80% 80%)"
  end

  private
  def color_mapping
     {
      yellow:   "#FFCC02",
      orange:   "#FF9500",
      blue:     "#017AFF",
      skyblue:  "#5AC7FA",
      red:      "#FF3B2F",
      black:    "#000000",
      white:    "#FFFFFF",
    }.with_indifferent_access
  end

  def text_color(circuit_color)
    if circuit_color.to_s == "white"
      "#333"
    else
      "#FFF"
    end
  end
end
