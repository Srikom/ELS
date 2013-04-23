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

	def report
		@report = Report.all
		@leaveApp = LeaveApplication.all
		@leaveApp.each do |l| 
			LeaveApplication.leaveApplicationReportEntry(l.start_date.strftime('%B'),l.start_date.strftime('%Y'),l.id)
		end
	end

	def showReport
		@report = Report.find(params[:id])
		@reportContent = Report.getReportContents(params[:id])
		@leaveApproved = Report.joins(:LeaveApplication).where(id:params[:id],:Leave_applications => {:status =>"Approved"}).count
		@leaveRejected = Report.joins(:LeaveApplication).where(id:params[:id],:Leave_applications => {:status =>"Rejected"}).count
		@leaveUnprocessed = Report.joins(:LeaveApplication).where(id:params[:id],:Leave_applications => {status:"Pending",status:"Approved By Manager",status:"Unsubmitted"}).count
	end

	def show
		@profile = Manager.select('*').joins(:department).where(id:current_manager)
	end

	def edit
		@profile = Manager.find(current_manager)
	end

	def update
		@profile = Manager.find(current_manager)

		if @profile.update_attributes(params[:profile])
			flash[:notice] = "Profile has been changed Successfully!"
			redirect_to manager_panel_path
		else
			flash[:alert] = "Unable to edit profile!"
			render 'edit'	
		end
	end

	def editPassword
		@profile = Manager.find(current_manager)
	end

	def updatePassword
		@profile = Manager.find(current_manager)

		if @profile.update_attributes(password:params[:password])
			flash[:notice] = "Password has been changed Successfully!"
			redirect_to manager_panel_path
		else
			flash[:alert] = "Unable to edit password!"
			render 'editPassword'	
		end
	end

end
