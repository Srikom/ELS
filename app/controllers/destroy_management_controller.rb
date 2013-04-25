class DestroyManagementController < ApplicationController
  def destroy
    @managements = Management.find(params[:id])
    @managements.destroy

    flash[:notice] = "User has been deleted"
    redirect_to admin_panel_index_path  
  end
end
