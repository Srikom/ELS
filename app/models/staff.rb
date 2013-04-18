class Staff < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :validatable
  attr_accessible :email, :password, :password_confirmation, :staff_name, :staff_phone, :department_id

  validates :staff_name, :staff_phone, :department_id, presence: true
  validates :staff_name, :staff_phone, uniqueness: true
  has_many :leave_applications
  belongs_to :department


end
