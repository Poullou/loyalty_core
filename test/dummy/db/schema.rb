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

ActiveRecord::Schema.define(version: 20151123223500) do

  create_table "core_offers", force: :cascade do |t|
    t.string   "ref"
    t.integer  "status"
    t.date     "started_at"
    t.date     "ended_at"
    t.date     "expired_at"
    t.integer  "required_units"
    t.integer  "discount_value"
    t.integer  "discount_level"
    t.boolean  "is_approved"
    t.boolean  "is_best"
    t.integer  "artisan_id"
    t.boolean  "default_target"
    t.integer  "precedence"
    t.string   "name"
    t.string   "title"
    t.string   "subtitle"
    t.text     "overview"
    t.string   "main_picture_url"
    t.text     "spotlight_picture_url"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "core_offers_core_retailers", id: false, force: :cascade do |t|
    t.integer "offer_id",    null: false
    t.integer "retailer_id", null: false
  end

  add_index "core_offers_core_retailers", ["offer_id", "retailer_id"], name: "index_core_offers_retailers"

  create_table "core_retailers", force: :cascade do |t|
    t.string   "ref"
    t.text     "ref_validator"
    t.integer  "barcode_type"
    t.string   "name"
    t.string   "main_picture_url"
    t.string   "front_card_picture_url"
    t.string   "back_card_picture_url"
    t.integer  "precedence"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
