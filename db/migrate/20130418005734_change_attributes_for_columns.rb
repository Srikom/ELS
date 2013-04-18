class ChangeAttributesForColumns < ActiveRecord::Migration
  def up
  	change_table :staffs do |t|
      t.change :staff_name, :string, null: false, :length => 3..50
      t.change :staff_phone, :string, null: false, :length => 12
      t.change :department_id, :integer, null: false
      t.change :leave_balance, :integer, null: false
    end
  end

  def down
  end
end
