class AddingDateColumnToHourslog < ActiveRecord::Migration[5.0]
  def change
  	add_column :hourlogs, :date, :datetime
  end
end
