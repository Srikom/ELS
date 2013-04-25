class ManagementPanelController < ApplicationController

	before_filter :authenticate_management!, :reportManagement 

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

	def applicationArchive

		if params[:search] == "null"
			@reviewedApplication = LeaveApplication.reviewedApplicationManagement(current_management)
			flash[:alert] = "Please select one of the filter status options!"
		else
			@reviewedApplication = LeaveApplication.searchManagement(params[:search],current_management)
		end
	end

	def reportManagement
		@report = Report.filterReports(params[:month],params[:year])
		@leaveApp = LeaveApplication.all
		@leaveApp.each do |l| 
			LeaveApplication.leaveApplicationReportEntry(l.start_date.strftime('%B'),l.start_date.strftime('%Y'),l.id)
		end
	end

	def showReportManagement
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
		@profile = Management.find(current_management)
	end

end
