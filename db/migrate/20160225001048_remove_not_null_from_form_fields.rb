class RemoveNotNullFromFormFields < ActiveRecord::Migration
  def change
    change_column_null :forms, :confirm_url, true
    change_column_null :forms, :source_url, true
    change_column_null :forms, :admin_url, true
    change_column_null :forms, :confirmed, true
    change_column_null :forms, :url, true
    change_column_null :forms, :email, true
    change_column_null :forms, :success_url, true
    change_column_null :forms, :failure_url, true
  end
end
