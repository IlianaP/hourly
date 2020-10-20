class Hourlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :hourlogs do |t|
      t.string :name
      t.string :project
      t.text :description
      t.integer :hours
      t.timestamps
    end
  end
end
