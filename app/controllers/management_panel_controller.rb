class ManagementPanelController < ApplicationController

	before_filter :authenticate_management!

	def index
		@leaveApplication = LeaveApplication.managementLeave(current_management)
	end

	def showApplication
		@leaveApplication = LeaveApplication.appDetails(params[:id])
		@review = LeaveApplication.find(params[:id])
	end 

	def updateReview
		@review = LeaveApplication.find(params[:id])
		if @review.update_attributes(status: params[:leave_application][:status])
			if @review.status == 'Rejected'
				@review.comment = 'Application has been rejected'
			elsif @review.status == 'Approved'
				@review.comment = 'Application has been Approved'
			end
			if @review.save
				flash[:notice] = "Successfully Updated Status"
			end
		else
			flash[:alert] = "Failed to Update Status"
		end
		redirect_to showApplication_management_panel_path(params[:id])
	end

	def destroy 
		@managements = Management.find(params[:id])	
 		@managements.destroy

 		flash[:notice] = "User has been deleted"
 		redirect_to admin_panel_index_path
	end

end
