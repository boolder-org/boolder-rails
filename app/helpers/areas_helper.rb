module AreasHelper
  def use_case_card(title:, color:, &block)
    render(
      partial: 'areas/index/use_case_card',
      locals: { title: title, color: color, block: block }
    )
  end
end
