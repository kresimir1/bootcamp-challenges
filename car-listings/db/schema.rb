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

ActiveRecord::Schema.define(version: 20161111200604) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string  "model",           null: false
    t.integer "manufacturer_id", null: false
    t.string  "color",           null: false
    t.integer "year",            null: false
    t.integer "milage",          null: false
    t.text    "description"
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "name",    null: false
    t.string "country", null: false
  end

  create_table "searches", force: :cascade do |t|
    t.string   "keywords"
    t.string   "manufacturer_name"
    t.string   "color"
    t.integer  "year"
    t.integer  "max_milage"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

end
