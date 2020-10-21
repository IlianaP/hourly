class AlterHourlogAddProjectIdColumn < ActiveRecord::Migration[5.0]
  def change
  	add_column :hourlogs, :project_id, :integer
  	add_index :hourlogs, :project_id
  end
end
