class ChangeAttributesForLeaveApplication < ActiveRecord::Migration
  def up
  	change_table :leave_applications do |t|
      t.change :comment, :text, null: true, :length => 3..50
      t.change :management_phone, :string, null: false, :length => 12
    end
  end

  def down
  end
end
