class CustomFailure < Devise::FailureApp
  def redirect_url
    if warden_options[:scope] == :staff
      staff_panel_index_path
    elsif warden_options[:scope] == :admin
      admin_panel_index_path
    elsif warden_options[:scope] == :manager
      manager_panel_index_path
    elsif warden_options[:scope] == :management
      management_panel_index_path
    end
  end
  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end
end