class Manager < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :validatable

  attr_accessible :email, :password, :password_confirmation, :manager_name, :manager_phone, :department_id, :admin

  validates :manager_name, :manager_phone, :department_id, presence: true
  
  has_many :leave_applications
  belongs_to :department

end
