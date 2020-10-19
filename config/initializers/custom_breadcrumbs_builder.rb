class CustomBreadcrumbsBuilder < BreadcrumbsOnRails::Breadcrumbs::Builder

  def render
    @elements.collect do |element|
      render_element(element)
    end.join(@options[:separator] || " &raquo; ")
  end

  def render_element(element)
    if element.path == nil
      content = compute_name(element)
    else
      content = @context.link_to_unless_current(compute_name(element), compute_path(element), element.options)
    end
    if @options[:tag]
      @context.content_tag(
        @options[:tag], content, class: [@options[:class], element.options[:class]].join(" ")
      )
    else
      ERB::Util.h(content)
    end
  end

end