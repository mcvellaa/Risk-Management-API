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

ActiveRecord::Schema.define(version: 20161103180249) do

  create_table "assignments", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "location_id"
    t.integer  "user_id"
    t.datetime "start"
    t.datetime "end"
    t.boolean  "attended",    default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "check_ins", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "invitation_id"
    t.datetime "time"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "check_outs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "invitation_id"
    t.datetime "time"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "data", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "question_id"
    t.string   "response"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "event_users", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.string   "role",              default: "Member"
    t.string   "last_location"
    t.datetime "location_datetime"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "location"
    t.datetime "start"
    t.datetime "end"
    t.integer  "max_attendance"
    t.datetime "time_to_send_invites"
    t.datetime "list_close"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "from"
    t.datetime "datetime"
    t.string   "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guests", force: :cascade do |t|
    t.string   "name"
    t.string   "optional_title"
    t.string   "optional_text"
    t.string   "phone"
    t.string   "birthdate"
    t.boolean  "texting_consent", default: true
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "invitations", force: :cascade do |t|
    t.integer  "guest_id"
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "location_id"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "question"
    t.boolean  "required"
    t.string   "form_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "path_to_fb_info"
    t.datetime "last_logged_on"
    t.datetime "date_joined"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
