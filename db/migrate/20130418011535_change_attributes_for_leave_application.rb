class ChangeAttributesForLeaveApplication < ActiveRecord::Migration
  def up
  	change_table :leave_applications do |t|
      t.change :status, :string, null: false, :length => 3..50, default: 'Not Submitted'
      t.change :comment, :string, null: false, :length => 2..255, default: 'Application has not submitted'
    end
  end

  def down
  end
end
