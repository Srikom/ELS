class StaffPanelController < ApplicationController

	before_filter :authenticate_staff! 

	def index
		if params[:search] == "null"
			@leaveApplications = LeaveApplication.processStaffApplication(current_staff)
			flash[:alert] = "Please select one of the filter status options!"
		else
			@leaveApplications = LeaveApplication.searchStaffApplications(params[:search],current_staff)
		end
		flash.discard
	end

	def show_application
  		@leaveApplication=LeaveApplication.appDetails(params[:id])	
 	end

 	def new_application
 		@leaveApplication= LeaveApplication.new
 	end

 	def create_application
 		@leaveApplication= LeaveApplication.new
 		redirect_to staff_panel_index_path
 	end

 	def edit_application
 		@leaveApplication= LeaveApplication.new
 	end

 	def update_application

 		redirect_to show_application_staff_panel_path(params[:id])
 	end

 	def submit_application

 		redirect_to staff_panel_index_path
 	end

 	def destroy_application

 		redirect_to staff_panel_index_path
 	end

 	def archive_application
		if params[:search] == "null"
			@reviewedApplication = LeaveApplication.reviewedApplication(current_manager,current_manager.department_id)
			flash[:alert] = "Please select one of the filter status options!"
		else
			@reviewedApplication = LeaveApplication.search(params[:search],current_manager,current_manager.department_id)
		end
		@leaveApplications= LeaveApplication.find_by_sql(%q{Select status,id,reason FROM leave_applications where staff_id="1"})
		flash.discard
	end

 	def profile
 		@leaveApplications= LeaveApplication.find_by_sql(%q{select id FROM staffs where staff_name="Eric Jerome"} )
 		@leaveApplications= LeaveApplication.find_by_sql(%q{select  department_name FROM departments where id="1"} )
	end
 
 	def edit_profile
		@leaveApplication = LeaveApplication.find(params[:id])
		redirect_to view_profile_staff_panel_path
	end

	

end

