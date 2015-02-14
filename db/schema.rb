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

ActiveRecord::Schema.define(version: 20150212021656) do

  create_table "cities", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.text     "short_description", limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.text     "short_description", limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "neighbors", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.integer  "stratus",           limit: 4
    t.text     "short_description", limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "properties", force: :cascade do |t|
    t.decimal  "area",                            precision: 10
    t.string   "building_name",     limit: 255
    t.integer  "floor",             limit: 4
    t.integer  "floors_number",     limit: 4
    t.string   "address",           limit: 255
    t.text     "short_description", limit: 65535
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.text     "short_description", limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",   limit: 255
    t.string   "password",   limit: 255
    t.string   "dni_number", limit: 255
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.string   "email",      limit: 255
    t.string   "phone",      limit: 255
    t.date     "birth_date"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "zones", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.text     "short_description", limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end
