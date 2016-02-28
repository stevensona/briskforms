class RemoveNotNullFromTimestamps < ActiveRecord::Migration
  def change
    change_column_null :forms, :updated_at, true
    change_column_null :forms, :created_at, true
  end
end
