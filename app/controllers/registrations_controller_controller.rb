class RegistrationsController < Devise::RegistrationsController

  protected

    def after_update_path_for(resource)
      showProfile_manager_panel_path(resource)
    end
end