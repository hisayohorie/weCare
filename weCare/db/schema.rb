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

ActiveRecord::Schema.define(version: 20160607003706) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "address"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "service_id"
    t.boolean  "confirmation", default: false
    t.integer  "profile_id"
    t.datetime "start_time"
    t.datetime "end_time"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "age"
    t.string   "description"
    t.integer  "exp_num"
    t.string   "education"
    t.string   "language"
    t.string   "availability"
    t.integer  "travel_propensity"
    t.string   "transportation"
    t.boolean  "pets"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "phone_number"
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.integer  "rate"
  end

  create_table "profiles_services", id: false, force: :cascade do |t|
    t.integer "profile_id", null: false
    t.integer "service_id", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "description"
    t.integer  "star_rating"
    t.integer  "dependability"
    t.integer  "punctuality"
    t.integer  "reliable_transportation"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "profile_id"
    t.integer  "hire_again"
  end

  create_table "services", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "category"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                        null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "photo"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree

end
