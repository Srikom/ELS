class ChangeAttributesForDepartment < ActiveRecord::Migration
  def up
  	change_table :departments do |t|
      t.change :department_name, :string, null: false, :length => 5..50
    end
  end

  def down
  end
end
