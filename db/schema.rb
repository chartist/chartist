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

ActiveRecord::Schema.define(version: 20140508150635) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "charts", force: true do |t|
    t.string   "name"
    t.integer  "chart_type",       default: 0
    t.integer  "x_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "csv_file_name"
    t.string   "csv_content_type"
    t.integer  "csv_file_size"
    t.datetime "csv_updated_at"
    t.integer  "user_id"
    t.integer  "colorscheme"
    t.text     "description"
  end

  add_index "charts", ["user_id"], name: "index_charts_on_user_id", using: :btree

  create_table "charts_dashboards", id: false, force: true do |t|
    t.integer "chart_id",     null: false
    t.integer "dashboard_id", null: false
  end

  create_table "dashboards", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "dashboards", ["user_id"], name: "index_dashboards_on_user_id", using: :btree

  create_table "datapoints", force: true do |t|
    t.string   "x"
    t.float    "y"
    t.integer  "chart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "series_id"
  end

  add_index "datapoints", ["chart_id"], name: "index_datapoints_on_chart_id", using: :btree
  add_index "datapoints", ["series_id"], name: "index_datapoints_on_series_id", using: :btree

  create_table "series", force: true do |t|
    t.integer  "chart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "order"
  end

  add_index "series", ["chart_id"], name: "index_series_on_chart_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "username"
    t.text     "bio"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
