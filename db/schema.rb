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

ActiveRecord::Schema.define(version: 20140208134148) do

  create_table "publisher_addresses", force: true do |t|
    t.string   "company_name"
    t.string   "street"
    t.integer  "street_no"
    t.string   "postal_code"
    t.string   "city"
    t.string   "nip"
    t.string   "type"
    t.integer  "publisher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_addresses", ["publisher_id"], name: "index_publisher_addresses_on_publisher_id"

  create_table "publisher_contacts", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.integer  "publisher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_contacts", ["publisher_id"], name: "index_publisher_contacts_on_publisher_id"

  create_table "publishers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
