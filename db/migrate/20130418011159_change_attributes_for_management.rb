class ChangeAttributesForManagement < ActiveRecord::Migration
  def up
  	change_table :managements do |t|
      t.change :management_name, :string, null: false, :length => 3..50
      t.change :management_phone, :string, null: false, :length => 12
    end
  end

  def down
  end
end
