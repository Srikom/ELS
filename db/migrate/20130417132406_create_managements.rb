class CreateManagements < ActiveRecord::Migration
  def change
    create_table :managements do |t|
      t.string :management_name
      t.string :management_phone
      t.string :management_email
      t.string :management_password

      t.timestamps
    end
  end
end
