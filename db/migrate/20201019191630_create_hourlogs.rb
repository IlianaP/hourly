class CreateHourlogs < ActiveRecord::Migration[5.0]
  def change

  	drop_table :enterhours do |t|
  		t.string   "name"
	    t.string   "projectworked"
	    t.text     "workdescription"
	    t.integer  "hoursworked"
	    t.datetime "created_at",      null: false
	    t.datetime "updated_at",      null: false
	end 

  end
end
