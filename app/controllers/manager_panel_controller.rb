class ManagerPanelController < ApplicationController

	before_filter :authenticate_manager!

	def index
		@leaveApplication = LeaveApplication.myDepartment(current_manager)
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
			elsif @review.status == 'Approved By Manager'
				@review.comment = 'Application has been Approved by the Manager'
			end
			if @review.save
				flash[:notice] = "Successfully Updated Status"
			end
		else
			flash[:alert] = "Failed to Update Status"
		end
		redirect_to showApplication_manager_panel_path(params[:id])
	end

	def applicationArchive

		if params[:search] == "null"
			@reviewedApplication = LeaveApplication.reviewedApplication(current_manager,current_manager.department_id)
			flash[:alert] = "Please select one of the filter status options!"
		else
			@reviewedApplication = LeaveApplication.search(params[:search],current_manager,current_manager.department_id)
		end
	end

end
