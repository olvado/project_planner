# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150318120618) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "projects", force: :cascade do |t|
    t.string   "name",                                null: false
    t.string   "color"
    t.integer  "weeks",                               null: false
    t.decimal  "fee",        precision: 10, scale: 2, null: false
    t.datetime "start_at",                            null: false
    t.datetime "end_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "projects", ["fee"], name: "index_projects_on_fee", using: :btree
  add_index "projects", ["start_at"], name: "index_projects_on_start_at", using: :btree

  create_table "resources", force: :cascade do |t|
    t.string   "name",                                null: false
    t.decimal  "allocation", precision: 3,  scale: 2, null: false
    t.decimal  "fee",        precision: 10, scale: 2, null: false
    t.integer  "project_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "resources", ["project_id"], name: "index_resources_on_project_id", using: :btree

end
