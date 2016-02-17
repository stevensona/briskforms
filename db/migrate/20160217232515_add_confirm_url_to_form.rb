class AddConfirmUrlToForm < ActiveRecord::Migration
  def up
    add_column :forms, :confirm_url, :string
    change_column_null :forms, :confirm_url, false
  end
  def down
    remove_column :forms, :confirm_url, :string    
  end
end
