class Report < ActiveRecord::Base
  attr_accessible :report_month, :report_name, :report_year

  has_many :LeaveApplication

  def self.getReport(month,year)
    where(report_month:month,report_year:year)
  end

  def self.getReportContents(report_id)
  	select('staffs.id,staffs.staff_name,departments.department_name,leave_applications.status').joins(:LeaveApplication => {:staff => :department}).where(id: report_id)
  end
  
end
