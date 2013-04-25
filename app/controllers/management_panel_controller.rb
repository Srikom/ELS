class ManagementPanelController < ApplicationController

	before_filter :authenticate_management!

	def index
		@leaveApplication = LeaveApplication.managementLeave(current_management)
	end

	def showApplication
		@leaveApplication = LeaveApplication.appDetails(params[:id])
		@review = LeaveApplication.find(params[:id])
	end 

	def destroy 
		@managements = Management.find(params[:id])	
 		@managements.destroy

 		flash[:notice] = "User has been deleted"
 		redirect_to admin_panel_index_path
	end

end
