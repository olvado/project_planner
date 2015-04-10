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

ActiveRecord::Schema.define(version: 20150410113643) do

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

  create_table "users", force: :cascade do |t|
    t.string   "email",                                                                     null: false
    t.string   "first_name"
    t.string   "last_name"
    t.decimal  "cost_rate",                         precision: 8, scale: 2
    t.decimal  "default_hourly_rate",               precision: 8, scale: 2
    t.string   "department"
    t.boolean  "has_access_to_all_future_projects",                         default: false
    t.string   "identity_url"
    t.boolean  "is_active",                                                 default: true
    t.boolean  "is_admin",                                                  default: false
    t.boolean  "is_contractor",                                             default: false
    t.string   "opensocial_identifier"
    t.integer  "telephone"
    t.string   "timezone"
    t.boolean  "wants_newsletter",                                          default: false
    t.boolean  "wants_weekly_digest",                                       default: false
    t.datetime "weekly_digest_sent_on"
    t.datetime "harvest_created_at"
    t.datetime "harvest_updated_at"
    t.decimal  "expected_weekly_hours",             precision: 5, scale: 2
    t.string   "encrypted_password",                                        default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                             default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                                null: false
    t.datetime "updated_at",                                                                null: false
  end

end
