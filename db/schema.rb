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

ActiveRecord::Schema.define(version: 20171116012356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "missing_people", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.string "sex"
    t.string "eye_color"
    t.string "hair_color"
    t.string "skin_color"
    t.string "race"
    t.string "other_phys_features"
    t.string "last_seen_city"
    t.string "last_seen_state"
    t.string "last_seen_place"
    t.string "last_seen_with"
    t.string "other_information"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
