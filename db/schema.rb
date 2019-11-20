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

ActiveRecord::Schema.define(version: 2019_11_20_131345) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "tablescape_id"
    t.date "date_from"
    t.date "date_to"
    t.integer "total_price"
    t.integer "attendees"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tablescape_id"], name: "index_bookings_on_tablescape_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "category"
    t.bigint "tablescape_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tablescape_id"], name: "index_items_on_tablescape_id"
  end

  create_table "tablescapes", force: :cascade do |t|
    t.string "name"
    t.integer "price_per_person"
    t.text "description"
    t.bigint "user_id"
    t.string "tag"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image", default: "https://images.unsplash.com/photo-1550826679-1b8ba79f1c18?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80", null: false
    t.index ["user_id"], name: "index_tablescapes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "tablescapes"
  add_foreign_key "bookings", "users"
  add_foreign_key "items", "tablescapes"
  add_foreign_key "tablescapes", "users"
end
