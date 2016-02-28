class RemoveUnusedFieldsFromForm < ActiveRecord::Migration
  def change
    remove_column :forms, :source_url, :string
    remove_column :forms, :failure_url, :string
  end
end
