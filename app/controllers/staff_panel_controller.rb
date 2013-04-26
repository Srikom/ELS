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

 	def archive
 		@leaveApplications= LeaveApplication.find_by_sql(%q{Select status,id,reason FROM leave_applications where staff_id="1"})
    end

 	def profile
 		@leaveApplications= LeaveApplication.find_by_sql(%q{select id FROM staffs where staff_name="Eric Jerome"} )
 		@leaveApplications= LeaveApplication.find_by_sql(%q{select  department_name FROM departments where id="1"} )
	end
 
 	def edit_profile
		@leaveApplication = LeaveApplication.find(params[:id])
		redirect_to view_profile_staff_panel_path
	end

	def _form
		@leaveApplication= LeaveApplication.new
	end

end

