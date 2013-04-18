class DeviseCreateStaffs < ActiveRecord::Migration
  def change
    create_table(:staffs) do |t|
      ## Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      t.string :staff_name
      t.string :staff_phone
      t.string :staff_email
      t.integer :department_id
      t.integer :leave_balance

      t.timestamps
    end
  end
end
