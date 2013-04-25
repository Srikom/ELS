class DestroyManagerController < ApplicationController
  def destroy
    @managers = Manager.find(params[:id])
    @managers.destroy

    flash[:notice] = "User has been deleted"
    redirect_to admin_panel_index_path  
  end
end
