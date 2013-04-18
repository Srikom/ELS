class ChangeAttributesForManager < ActiveRecord::Migration
  def up
  	change_table :managers do |t|
      t.change :manager_name, :string, null: false, :length => 3..50
      t.change :manager_phone, :string, null: false, :length => 12
      t.change :department_id, :integer, null: false
      t.change :admin, :boolean, null: false, default: false
    end
  end

  def down
  end
end
