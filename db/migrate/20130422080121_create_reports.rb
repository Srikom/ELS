class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :report_name
      t.string :report_month
      t.string :report_year

      t.timestamps
    end
  end
end
