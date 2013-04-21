class LeaveApplicationController < ApplicationController

	before_filer :authenticate_staff!

	def index

	end
def view_profile
		@leaveApplication = LeaveApplication.find(params[:id])
		redirect_to view_profile_staff_panel_path(params[:id])
	end
	def new
		@leaveapplication=LeaveApplication.new
	end

	def create
		@leaveapplication=LeaveApplication.new(params[:leaveapplication])
	if  @leaveapplication.save
       
      redirect_to new_leave_application_path,:notice=>"Your leaveapplication was saved"
      
    else
      render "new"
	end

end
