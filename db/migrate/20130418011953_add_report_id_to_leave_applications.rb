class AddReportIdToLeaveApplications < ActiveRecord::Migration
  def change
    add_column :leave_applications, :report_id, :integer, null: true
  end
end
