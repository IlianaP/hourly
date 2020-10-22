# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20201022001548) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hourlogs", force: :cascade do |t|
    t.string   "name"
    t.string   "project"
    t.text     "description"
    t.integer  "hours"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.datetime "date"
    t.integer  "project_id"
    t.index ["project_id"], name: "index_hourlogs_on_project_id", using: :btree
    t.index ["user_id"], name: "index_hourlogs_on_user_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "plan"
    t.integer  "planhours"
    t.integer  "thours"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.datetime "plandate"
    t.datetime "starthourtrack"
    t.integer  "duration"
    t.text     "notes"
    t.boolean  "status",         default: true
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
