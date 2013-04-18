class RemoveStaffEmailFromStaffs < ActiveRecord::Migration
  def up
    remove_column :staffs, :staff_email
  end

  def down
    add_column :staffs, :staff_email, :string
  end
end
