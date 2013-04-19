class LeaveApplication < ActiveRecord::Base
  attr_accessible :comment, :end_date, :management_id, :manager_id, :reason, :staff_id, :start_date, :status

  validates :start_date, :end_date, :reason, presence: true
  


  belongs_to :staff
  belongs_to :manager
  belongs_to :management
  belongs_to :report 


  def self.myDepartment(manager)
  	LeaveApplication.select('staff_id,staff_name,department_name,leave_applications.created_at,status').joins(:staff => :department).where(manager_id:manager)
  end

end
