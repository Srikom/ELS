class ApplicationController < ActionController::Base
  protect_from_forgery

  	def after_sign_in_path_for(resource)
  		stored_location_for(resource) ||
    		if resource.is_a?(Staff)
      			staff_panel_index_path
    		elsif resource.is_a?(Admin)
      			admin_panel_index_path
      		elsif resource.is_a?(Manager)
      			manager_panel_index_path
      		elsif resource.is_a?(Management)
      			management_panel_index_path
    		end
	end

	private 

  def after_sign_out_path_for(resource_or_scope)
    new_staff_session_path
  end
end
