module HelperFunctions

	# ActionView helpers
	def add_current_user_to_js
		# this adds the Devise current_user hash object to a JavaScript "app" object.
		"<script>app._current_user = #{current_user.to_json};</script>".html_safe if current_user
	end

	# General Model/Resource name to String or Class Conversion
	def type_as_class(resource_name)
	    resource_name.singularize.capitalize.constantize
	end

	def show_path_for(resource)
	    "/#{type_as_string(resource)}/#{resource.id.to_s}"
	end

	def type_as_string(resource)
		resource.class.to_s.downcase.pluralize
	end

	def comment_create_path(resource)
		"#{show_path_for(resource)}/comments/create"
	end

end