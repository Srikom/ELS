class ManagerPanelController < ApplicationController

	before_filter :authenticate_manager!

	def index
		@leaveApplication = LeaveApplication.myDepartment(current_manager)
	end

end
