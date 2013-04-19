class LeaveApplication < ActiveRecord::Base
  attr_accessible :comment, :end_date, :management_id, :manager_id, :reason, :staff_id, :start_date, :status

  validates :start_date, :end_date, :reason, presence: true
  
  scope :myDepartment , where(manager_id:2)

  belongs_to :staff
  belongs_to :manager
  belongs_to :management
  belongs_to :report 
end
