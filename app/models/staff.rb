class Staff < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :validatable
  attr_accessible :email, :password, :password_confirmation, :staff_name, :staff_phone, :department_id, :leave_balance

  validates :staff_name, :staff_phone, :department_id, :leave_balance, presence: true

  has_many :leave_applications
  belongs_to :department

end
