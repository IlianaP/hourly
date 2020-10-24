class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :fname, :string
  	add_column :users, :lname, :string
  	add_column :users, :role, :string
  	add_column :users, :is_admin, :boolean, default: false
  	add_column :users, :is_approved, :boolean, default: false
  end
end
