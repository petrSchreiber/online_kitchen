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

ActiveRecord::Schema.define(version: 20170607124421) do

  create_table "configurations", force: :cascade do |t|
    t.string   "name",        default: "",    null: false
    t.string   "folder_name"
    t.integer  "user_id"
    t.boolean  "deleted",     default: false, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "configurations", ["name"], name: "index_configurations_on_name", unique: true

  create_table "machines", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.string   "state",                      default: "queued"
    t.string   "ip"
    t.string   "provider_id"
    t.text     "environment"
    t.integer  "configuration_id"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "cluster"
    t.boolean  "expirable",                  default: true
    t.date     "expiration"
    t.integer  "expiration_extension_count", default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                       default: "", null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "expiration_extension_limit", default: 2
  end

  add_index "users", ["name"], name: "index_users_on_name", unique: true

end
