class ManagerPanelController < ApplicationController

	before_filter :authenticate_manager!, :report 

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
		@report = Report.filterReports(params[:month],params[:year])
		@leaveApp = LeaveApplication.all
		@leaveApp.each do |l| 
			LeaveApplication.leaveApplicationReportEntry(l.start_date.strftime('%B'),l.start_date.strftime('%Y'),l.id)
		end
	end

	def showReport
		@report = Report.find(params[:id])
		@reportContent = Report.getReportContents(params[:id])
		@leaveApproved = Report.countStatus(params[:id],"Approved")
		@leaveRejected = Report.countStatus(params[:id],"Rejected")
		@leavePending = Report.countStatus(params[:id],"Pending")
		@leaveApprovedByManager = Report.countStatus(params[:id],"Approved By Manager")
		@leaveUnsubmitted = Report.countStatus(params[:id],"Not Submitted")

		respond_to do |format|
			format.html
			format.pdf do
				pdf = ReportPdf.new(@report,@reportContent,@leaveApproved,@leaveRejected,@leavePending,@leaveApprovedByManager,@leaveUnsubmitted)
				send_data pdf.render, filename:"report_#{@report.report_name}.pdf",
									 type:"application/pdf",
									 disposition:"inline"
			end
		end
	end

	def show
		@profile = Manager.select('*').joins(:department).where(id:current_manager)
	end

end
