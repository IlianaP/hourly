class AlterHourlogAddUserIdColumn < ActiveRecord::Migration[5.0]
  def change
  	add_column :hourlogs, :user_id, :integer
  	add_index :hourlogs, :user_id
  end
end
