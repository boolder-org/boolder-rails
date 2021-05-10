module ProblemsHelper
  def problem_circle_view(problem)
    circle_view(problem.circuit_number.presence || "&nbsp;".html_safe, 
      background_color: uicolor(problem.circuit&.color), 
      text_color: text_color(problem.circuit&.color)
    )
  end

  def problem_circle_view_with_name(problem)
    problem_circle_view(problem) + 
      (link_to problem.name_with_fallback, edit_admin_problem_path(problem), class: "ml-2 font-semibold")
  end

  def circuit_circle_view(circuit, klass: "h-6 w-6 leading-6")
    circle_view("&nbsp;".html_safe, 
      background_color: uicolor(circuit&.color), 
      text_color: text_color(circuit&.color),
      klass: klass
    )
  end

  def uicolor(circuit_color)
    color_mapping[circuit_color] || "rgb(80% 80% 80%)"
  end

  def bleau_info_url(problem)
    "https://bleau.info/c/#{problem.bleau_info_id}.html" if problem.bleau_info_id.present?
  end

  private

  def circle_view(content, background_color:, text_color:, klass: "h-6 w-6 leading-6")
    content_tag(:span, content, 
      style: "background: #{background_color}; color: #{text_color}",
      class: "rounded-full #{klass} inline-flex justify-center")
  end

  def color_mapping
     {
      yellow:   "#FFCC02",
      orange:   "#FF9500",
      green:    "#77C344",
      blue:     "#017AFF",
      skyblue:  "#5AC7FA",
      salmon:   "#FDAF8A",
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
