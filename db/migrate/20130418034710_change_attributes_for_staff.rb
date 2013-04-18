class ChangeAttributesForStaff < ActiveRecord::Migration
  def up
  	change_column :staffs, :leave_balance, :integer, null: true
  end

  def down
  end
end
