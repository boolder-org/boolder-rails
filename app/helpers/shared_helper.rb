module SharedHelper
  def warning_box(&block)
    render(
      partial: 'shared/warning',
      locals: { block: block }
    )
  end

  def cdn_image_tag(source, options = {})
    image_tag(cdn_image_url(source), **options)
  end
end
