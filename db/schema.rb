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

ActiveRecord::Schema.define(version: 2020_07_19_101537) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "custom_attributes", force: :cascade do |t|
    t.string "name"
    t.integer "data_type"
    t.integer "source"
    t.boolean "required"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "custom_data", force: :cascade do |t|
    t.string "customizable_type"
    t.bigint "customizable_id"
    t.bigint "custom_attribute_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["custom_attribute_id"], name: "index_custom_data_on_custom_attribute_id"
    t.index ["customizable_type", "customizable_id"], name: "index_custom_data_on_customizable_type_and_customizable_id"
  end

  create_table "event_registrations", force: :cascade do |t|
    t.string "email", null: false
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_event_registrations_on_email"
    t.index ["event_id"], name: "index_event_registrations_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
  end

  add_foreign_key "custom_data", "custom_attributes"
  add_foreign_key "event_registrations", "events"
  add_foreign_key "profiles", "users"
end
