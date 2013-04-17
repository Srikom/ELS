class CreateLeaveApplications < ActiveRecord::Migration
  def change
    create_table :leave_applications do |t|
      t.integer :staff_id
      t.integer :manager_id
      t.integer :management_id
      t.date :start_date
      t.date :end_date
      t.text :reason
      t.string :status
      t.text :comment

      t.timestamps
    end
  end
end
