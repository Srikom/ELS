class Report < ActiveRecord::Base
  attr_accessible :report_month, :report_name, :report_year

  has_many :LeaveApplication

  def self.getReport(month,year)
    where(report_month:month,report_year:year)
  end

  def self.getReportContents(report_id)
  	select('staffs.id,staffs.staff_name,departments.department_name,leave_applications.status').joins(:LeaveApplication => {:staff => :department}).where(id: report_id)
  end
  
  def self.countStatus(report_id,status)
    joins(:LeaveApplication).where(id:report_id,:Leave_applications => {:status =>status}).count
  end

  def self.filterReports(month,year)
  if year != 'null' && month != 'null'
  	if year && month
		Report.where(report_month:month,report_year:year)
	else
		Report.all
	end
  elsif month != 'null'
		Report.where(report_month:month)
  elsif year != 'null'
		Report.where(report_year:year)
  else
  	Report.all
 end
  end

end
