module AreasHelper
  def use_case_card(title:, color:, &block)
    render(
      partial: 'areas/index/use_case_card',
      locals: { title: title, color: color, block: block }
    )
  end

  def level_bar(level: "", disabled: false, klass: "h-6 w-6 leading-6")
    background_color = disabled ? "rgba(204, 204, 204, .5)" : "rgba(5, 150, 105, 0.8)"

    content_tag(:span, level, 
      style: "background-color: #{background_color}; color: #FFF",
      class: "rounded-sm text-sm #{klass} inline-flex justify-center"
    )
  end
end
