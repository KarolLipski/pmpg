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

ActiveRecord::Schema.define(version: 20140308131942) do

  create_table "addresses", force: true do |t|
    t.string   "company_name"
    t.string   "street"
    t.integer  "street_no"
    t.string   "postal_code"
    t.string   "city"
    t.string   "nip"
    t.string   "address_type"
    t.integer  "publisher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "addressable_id"
    t.string   "addressable_type"
  end

  add_index "addresses", ["publisher_id"], name: "index_addresses_on_publisher_id"

  create_table "chains", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.integer  "publisher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contactable_id"
    t.string   "contactable_type"
  end

  add_index "contacts", ["publisher_id"], name: "index_contacts_on_publisher_id"

  create_table "issue_frequencies", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issues", force: true do |t|
    t.string   "title"
    t.integer  "issue_frequency_id"
    t.boolean  "archive"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "publisher_id"
  end

  add_index "issues", ["issue_frequency_id"], name: "index_issues_on_issue_frequency_id"
  add_index "issues", ["publisher_id"], name: "index_issues_on_publisher_id"

  create_table "offer_issues", force: true do |t|
    t.integer  "offer_id"
    t.integer  "issue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "offer_issues", ["issue_id"], name: "index_offer_issues_on_issue_id"
  add_index "offer_issues", ["offer_id"], name: "index_offer_issues_on_offer_id"

  create_table "offers", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publishers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sell_point_offers", force: true do |t|
    t.integer  "offer_id"
    t.integer  "sell_point_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sell_point_offers", ["offer_id"], name: "index_sell_point_offers_on_offer_id"
  add_index "sell_point_offers", ["sell_point_id"], name: "index_sell_point_offers_on_sell_point_id"

  create_table "sell_points", force: true do |t|
    t.string   "name"
    t.integer  "chain_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sell_points", ["chain_id"], name: "index_sell_points_on_chain_id"

end
