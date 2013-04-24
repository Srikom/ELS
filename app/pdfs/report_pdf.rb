class ReportPdf < Prawn::Document

	def initialize(report,content,approved,rejected,pending,approvedByManager,unsubmitted)
		super(top_margin:70)
		@report = report
		@content = content
		@approved = approved
		@rejected = rejected
		@pending = pending
		@approvedByManager = approvedByManager
		@unsubmitted = unsubmitted
		report_name
		table_data
		table_app
		footer_sig
	end

	def report_name
		text "#{@report.report_name}", size:30 , style: :bold,:align => :center
		move_down 5
		text "as on #{Date.today.strftime('%d %B %Y')}",style: :bold,:align => :center
		move_down 20
		text "Total number of applicants for this Month : #{@content.count}",:align => :center
		move_down 10
	end

	def table_data
		text "Application Review Statistic For the Month",:align => :center
		move_down 30
		table datas do
			row(0).font_style = :bold
			columns(0..4).align = :right
			self.row_colors = ["DDDDDD","FFFFFF"]
			self.header = true
		end
		move_down 10
	end

	def table_app
		text "List of Applicants for this month :",:align => :center
		move_down 3
		table applicants
	end

	def datas
		[["Approved","Rejected","Pending","Approved By Manager","Unsubmitted"]] + 
		[[@approved,@rejected,@pending,@approvedByManager,@unsubmitted]]
	end

	def applicants
		app = [["ID","Name","Department","Application Status"]] 
		app += @content.map do |s|
		[s.id,s.staff_name,s.department_name,s.status]
		end
	end

	def footer_sig
		move_down 10
		text "Submitted BY:",style: :bold,:align => :left
		text "Signatures:",style: :bold,:align => :right
	end

end