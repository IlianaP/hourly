class AddPartNumberToProducts < ActiveRecord::Migration[5.0]
  def change
  	add_column :hourlogs, :date_from, :datetime
  	add_column :hourlogs, :date_to, :datetime
  	add_column :hourlogs, :project_filter, :string
  end
end
