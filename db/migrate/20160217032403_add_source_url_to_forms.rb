class AddSourceUrlToForms < ActiveRecord::Migration
  def up
    add_column :forms, :source_url, :string
    change_column_null :forms, :source_url, false
  end
  def down
    remove_column :forms, :source_url, :string    
  end
end
