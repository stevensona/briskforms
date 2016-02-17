class AddConfirmedToForm < ActiveRecord::Migration
  def up
    add_column :forms, :confirmed, :boolean
    change_column_default :forms, :confirmed, false
    change_column_null :forms, :confirmed, false 
  end
  def down
    remove_column :forms, :confirmed, :boolean 
  end
end
