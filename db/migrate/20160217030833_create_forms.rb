class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :url, null: false
      t.string :email, null: false
      t.string :success_url, null: false
      t.string :failure_url, null: false
      t.timestamps null: false
    end
  end
end
