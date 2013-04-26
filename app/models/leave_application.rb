class LeaveApplication < ActiveRecord::Base
  attr_accessible :comment, :end_date, :management_id, :manager_id, :reason, :staff_id, :start_date, :status, :report_id

  validates :start_date, :end_date, :reason, presence: true
  
  

  belongs_to :staff
  belongs_to :manager
  belongs_to :management
  belongs_to :report 

  def self.processStaffApplication(sid)
    select("status,id,reason").where("staff_id = ? AND status = 'Pending' OR status = 'Not Submitted'",sid)
  end

  def self.searchStaffApplications(search,staff)
    if search
      select("status,id,reason").where("status = ? AND staff_id = ?",search,staff)
    else
      processStaffApplication(staff)
    end
  end

  def self.managementLeave(management)
    select('leave_applications.id,staff_id,staff_name,department_name,leave_applications.created_at,status').joins(:staff => :department).where(management_id:management,status:"Approved By Manager")
  end

  def self.myDepartment(manager)
  	select('leave_applications.id,staff_id,staff_name,department_name,leave_applications.created_at,status').joins(:staff => :department).where(manager_id:manager)
  end

  def self.appDetails(application)
  	select("*,(julianday(end_date)-julianday(start_date)) AS date_diff").joins(:staff => :department).where(id:application)
  end 

  def self.reviewedApplication(manager,department)
      select("leave_applications.id,staff_id,staff_name,department_name,leave_applications.created_at,status").joins(:staff => :department).where("status = ? OR status = ? OR status = ? AND manager_id = ? AND department_id = ?",'Rejected','Approved','Approved By Manager',manager,department)
  end

  def self.search(search,manager,department)
    if search
      select("leave_applications.id,staff_id,staff_name,department_name,leave_applications.created_at,status").joins(:staff => :department).where("status = ? AND manager_id = ? AND department_id = ?",search,manager,department)
    else
      reviewedApplication(manager,department)
    end
  end

  def self.reviewedApplicationManagement(management)
      select("leave_applications.id,staff_id,staff_name,department_name,leave_applications.created_at,status").joins(:staff => :department).where("status = ? OR status = ? AND management_id = ?",'Rejected','Approved',management)
  end

  def self.searchManagement(search,management)
    if search
      select("leave_applications.id,staff_id,staff_name,department_name,leave_applications.created_at,status").joins(:staff => :department).where("status = ? AND management_id = ?",search,management)
    else
      reviewedApplicationManagement(management)
    end
  end

  def self.leaveApplicationReportEntry(month,year,application)
    if Report.getReport(month,year).exists?
      report = Report.getReport(month,year) 
      lApp = LeaveApplication.find(application)
      report.each {|r| lApp.update_attributes(report_id:r.id)}
    else
      lAppReport = Report.new
      lAppReport.report_name = "#{month} Report #{year}"
      lAppReport.report_month = month
      lAppReport.report_year =  year
      if lAppReport.save!
        lApp = LeaveApplication.find(application)
        lApp.update_attributes(report_id:lAppReport.id)
      end 
    end
  end

  
end
