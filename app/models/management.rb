class Management < ActiveRecord::Base
  attr_accessible :management_email, :management_name, :management_password, :management_phone
end
