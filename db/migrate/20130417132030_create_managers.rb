class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.string :manager_name
      t.string :manager_phone
      t.string :manager_email
      t.string :manager_password
      t.integer :department_id
      t.boolean :admin

      t.timestamps
    end
  end
end
