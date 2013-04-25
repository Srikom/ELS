class DestroyStaffController < ApplicationController
  def destroy
    @staffs = Staff.find(params[:id])
    @staffs.destroy

    flash[:notice] = "User has been deleted"
    redirect_to admin_panel_index_path  
  end
end
