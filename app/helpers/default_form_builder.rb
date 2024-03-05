class DefaultFormBuilder < ActionView::Helpers::FormBuilder
  def text_field(attribute, options={})
    options.reverse_merge! class: "mt-1 focus:ring-emerald-500 focus:border-emerald-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md"
    super(attribute, options)
  end

  def label(method, text = nil, options = {})
    options.reverse_merge! class: "block text-sm font-medium text-gray-700"
    super(method, text, options)
  end

  def select(method, choices = nil, options = {}, html_options = {})
    html_options.reverse_merge! class: "mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-emerald-500 focus:border-emerald-500 sm:text-sm"
    super(method, choices, options, html_options)
  end

  def collection_select(method, collection, value_method, text_method, options = {}, html_options = {})
    html_options.reverse_merge! class: "mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-emerald-500 focus:border-emerald-500 sm:text-sm"
    super(method, collection, value_method, text_method, options, html_options)
  end

  def text_area(attribute, options = {})
    options.reverse_merge! class: "mt-1 focus:ring-emerald-500 focus:border-emerald-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md"
    super(attribute, options)
  end
end