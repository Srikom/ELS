class Staff < ActiveRecord::Base
  attr_accessible :department_id, :leave_balance, :staff_email, :staff_name, :staff_password, :staff_phone
end
