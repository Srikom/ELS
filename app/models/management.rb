class Management < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :validatable

  attr_accessible :email, :password, :password_confirmation, :management_name, :management_phone

  validates :management_name, :management_phone, presence: true
 
  has_many :leave_applications
end
