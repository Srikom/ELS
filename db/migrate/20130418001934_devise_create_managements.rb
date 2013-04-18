class DeviseCreateManagements < ActiveRecord::Migration
  def change
    create_table(:managements) do |t|
      ## Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      t.string :management_name
      t.string :management_phone
      t.string :management_email

      t.timestamps
    end
  end
end
