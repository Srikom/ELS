class Manager < ActiveRecord::Base
  attr_accessible :admin, :department_id, :manager_email, :manager_name, :manager_password, :manager_phone
end
