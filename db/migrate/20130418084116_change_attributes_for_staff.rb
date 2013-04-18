class ChangeAttributesForStaff < ActiveRecord::Migration
  def up
  	change_column :staffs, :leave_balance, :integer, null: true,default: 30
  end

  def down
  end
end
