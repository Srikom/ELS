class CreateLeaveApplications < ActiveRecord::Migration
  def change
    create_table :leave_applications do |t|
      t.integer :staff_id, null: false
      t.integer :manager_id
      t.integer :management_id
      t.date :start_date, null: false
      t.date :end_date,null: false
      t.text :reason,null: false
      t.string :status, default: 'Not Submitted'
      t.text :comment, default: 'Application has not Submitted'

      t.timestamps
    end
  end
end
