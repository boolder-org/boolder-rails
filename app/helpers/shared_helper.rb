module SharedHelper
  def warning_box(&block)
    render(
      partial: 'shared/warning',
      locals: { block: block }
    )
  end
end
