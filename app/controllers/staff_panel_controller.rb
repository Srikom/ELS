class StaffPanelController < ApplicationController

	before_filter :authenticate_staff!

	def index
		@leaveApplication = LeaveApplication.appDetails(params[:id])
@leaveApplications= LeaveApplication.find_by_sql(%q{Select status,id,reason FROM leave_applications} )
 respond_to do
render "staff_panel/index"
	end
end
end
