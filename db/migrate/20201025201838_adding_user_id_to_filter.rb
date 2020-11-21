class AddingUserIdToFilter < ActiveRecord::Migration[5.0]
  def change
  	add_column :filters, :user_id, :integer
  end
end
