class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
    	t.string :name
    	t.text :description
    	t.string :plan
    	t.integer :planhours
    	t.integer :thours
      t.timestamps
    end
  end
end
