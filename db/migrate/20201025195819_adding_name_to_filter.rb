class AddingNameToFilter < ActiveRecord::Migration[5.0]
  def change
  	add_column :filters, :email, :string
  end
end
