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

ActiveRecord::Schema.define(version: 20160814092718) do

  create_table "colors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colors_models", id: false, force: :cascade do |t|
    t.integer "model_id", null: false
    t.integer "color_id", null: false
  end

  create_table "models", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "models_sizes", id: false, force: :cascade do |t|
    t.integer "model_id", null: false
    t.integer "size_id",  null: false
  end

  create_table "orderdetails", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "model_id"
    t.integer  "size_id"
    t.integer  "color_id"
    t.decimal  "price",      default: "0.0"
    t.integer  "quantity",   default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "po_number"
    t.date     "shipment_require_date"
    t.date     "order_date"
    t.string   "ship_to"
    t.text     "reference"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "sizes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
