class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :report_name, null: false
      t.string :report_month, null: false
      t.integer :report_year, null: false

      t.timestamps
    end
  end
end
