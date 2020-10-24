class CreateFilters < ActiveRecord::Migration[5.0]
  def change
    create_table :filters do |t|
    	t.string :project
    	t.datetime :date_from
    	t.datetime :date_to
      t.timestamps
    end
  end
end
