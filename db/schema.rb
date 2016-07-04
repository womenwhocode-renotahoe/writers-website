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

ActiveRecord::Schema.define(version: 20160703011026) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.integer  "writer_id",  null: false
    t.integer  "goal_id",    null: false
    t.integer  "count",      null: false
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "activities", ["goal_id"], name: "index_activities_on_goal_id", using: :btree
  add_index "activities", ["writer_id"], name: "index_activities_on_writer_id", using: :btree

  create_table "goals", force: :cascade do |t|
    t.integer  "writer_id",                       null: false
    t.string   "title",                           null: false
    t.string   "verb",                            null: false
    t.integer  "count",           default: 1,     null: false
    t.string   "noun",                            null: false
    t.integer  "freq"
    t.integer  "current_count",   default: 0,     null: false
    t.datetime "by_date"
    t.boolean  "achieved",        default: false, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "verb_past_tense"
  end

  add_index "goals", ["writer_id"], name: "index_goals_on_writer_id", using: :btree

  create_table "stories", force: :cascade do |t|
    t.integer  "writer_id",                           null: false
    t.string   "title",                               null: false
    t.string   "summary",                             null: false
    t.text     "body",                                null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.datetime "date_time_published"
    t.boolean  "published",           default: false, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",                 null: false
    t.string   "encrypted_password",     default: "",                 null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.boolean  "admin",                  default: false,              null: false
    t.string   "state",                  default: "No actions taken", null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "time_zone"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "writers", force: :cascade do |t|
    t.string   "twitter"
    t.string   "full_name"
    t.text     "bio"
    t.string   "location"
    t.date     "birthdate"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "writers", ["user_id"], name: "index_writers_on_user_id", using: :btree

end
