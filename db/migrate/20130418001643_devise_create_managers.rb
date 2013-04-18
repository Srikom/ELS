class DeviseCreateManagers < ActiveRecord::Migration
  def change
    create_table(:managers) do |t|
      ## Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      t.string :manager_name
      t.string :manager_phone
      t.string :manager_email
      t.integer :department_id
      t.boolean :admin

      t.timestamps
    end
  end
end
