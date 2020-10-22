class AddingPlandateToProjects < ActiveRecord::Migration[5.0]
  def change
  	add_column :projects, :plandate, :datetime
  	add_column :projects, :starthourtrack, :datetime
  	add_column :projects, :duration, :integer
  	add_column :projects, :notes, :text
  end
end
