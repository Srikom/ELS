class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :staff_name
      t.string :staff_phone
      t.string :staff_email
      t.string :staff_password
      t.integer :department_id
      t.integer :leave_balance

      t.timestamps
    end
  end
end
