class RemoveManagementEmailFromManagements < ActiveRecord::Migration
  def up
    remove_column :managements, :management_email
  end

  def down
    add_column :managements, :management_email, :string
  end
end
