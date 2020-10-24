class ChangeProjectToIntegerInFilter < ActiveRecord::Migration[5.0]
  def change
  	change_column :filters, :project, 'integer USING CAST(project AS integer)'
  end
end
