class LeaveApplication < ActiveRecord::Base
  attr_accessible :comment, :end_date, :management_id, :manager_id, :reason, :staff_id, :start_date, :status

  validates :start_date, :end_date, :reason, presence: true
  
  scope :reviewedApplication, select("*").joins(:staff => :department).where("status = ? OR status = ?",'Rejected','Approved')


  belongs_to :staff
  belongs_to :manager
  belongs_to :management
  belongs_to :report 


  def self.myDepartment(manager)
  	select('leave_applications.id,staff_id,staff_name,department_name,leave_applications.created_at,status').joins(:staff => :department).where(manager_id:manager)
  end

  def self.appDetails(application)
  	select("*,(julianday(end_date)-julianday(start_date)) AS date_diff").joins(:staff => :department).where(id:application)
  end 

end
