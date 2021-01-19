class ApplicationController < ActionController::Base
	add_breadcrumb "Home", :root_path

	default_form_builder DefaultFormBuilder
end
