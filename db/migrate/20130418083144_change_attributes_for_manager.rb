class ChangeAttributesForManager < ActiveRecord::Migration
  def up
  	change_table :managers do |t|
      t.change :admin, :boolean, null: true, default: 0
    end
  end

  def down
  end
end
