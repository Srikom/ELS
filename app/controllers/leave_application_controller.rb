class LeaveApplicationController < ApplicationController

	before_filer :authenticate_staff!

	def index
	#@leaveApplication = LeaveApplication.appDetails(params[:id])
		@leaveApplication = LeaveApplication.find(Select status,id,reason FROM leave_applications )
		#@leaveApplications = LeaveApplication.all

	end
	 def show_application
  		@leaveApplication=LeaveApplication.appDetails(params[:id])
  		
 end
	def view_profile
		@leaveApplication = LeaveApplication.find(params[:id])
		redirect_to view_profile_staff_panel_path
	end
	def archive
  		@leaveApplication=LeaveApplication.Select status,id FROM leave_applications 
  		
 end
 def edit
    @leaveApplication = LeaveApplication.find(params[:id])
  end
 def new
		@leaveApplication=LeaveApplication.new
	end

	def create
		@leaveApplication=LeaveApplication.new(params[:leaveapplication])
	if  @leaveApplication.save
        flash[:notice] = "Some text indicating it was created"
      redirect_to _form_staff_panel_path,:notice=>"Your leave application was saved"
      
    else
    	 flash[:notice] = "Some text indicating it was created"
      render "new"
	end

end
end
