class RemoveManagerEmailFromManagers < ActiveRecord::Migration
  def up
    remove_column :managers, :manager_email
  end

  def down
    add_column :managers, :manager_email, :string
  end
end
