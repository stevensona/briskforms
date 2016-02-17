class AddAdminUrlToForms < ActiveRecord::Migration
  def up
    add_column :forms, :admin_url, :string
    change_column_null :forms, :admin_url, false
  end
  def down
    remove_column :forms, :admin_url, :string    
  end
end
