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

ActiveRecord::Schema.define(version: 20180502235121) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "zip"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hr_reps", force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.string "phone_1"
    t.string "phone_2"
    t.string "email"
    t.integer "business_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "job_seekers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "zip"
    t.string "status"
    t.string "occupation"
    t.string "experience"
    t.string "work_value"
    t.text "awesomeness"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file_upload"
    t.string "password_digest"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "occupation"
    t.string "experience"
    t.string "work_value"
    t.text "awesomeness"
    t.string "file_upload"
    t.string "status"
    t.integer "business_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer "job_id"
    t.integer "job_seeker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

end
