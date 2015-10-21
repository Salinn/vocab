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


ActiveRecord::Schema.define(version: 20151020162554) do

  create_table "courses", force: :cascade do |t|
    t.string   "class_name", limit: 255
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "courses_users", id: false, force: :cascade do |t|
    t.integer "course_id", limit: 4, null: false
    t.integer "user_id",   limit: 4, null: false
  end

  add_index "courses_users", ["course_id", "user_id"], name: "index_courses_users_on_course_id_and_user_id", using: :btree
  add_index "courses_users", ["user_id", "course_id"], name: "index_courses_users_on_user_id_and_course_id", using: :btree


  create_table "lessons", force: :cascade do |t|
    t.string   "lesson_name",       limit: 255
    t.integer  "lesson_points",     limit: 4
    t.datetime "lesson_start_time"
    t.datetime "lesson_end_date"
    t.integer  "course_id",         limit: 4
    t.integer  "penalty",           limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "lessons", ["course_id"], name: "index_lessons_on_course_id", using: :btree

  create_table "definitions", force: :cascade do |t|
    t.text     "word_definition", limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "word_id",         limit: 4
  end

  add_index "definitions", ["word_id"], name: "index_definitions_on_word_id", using: :btree


  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "word_forms", force: :cascade do |t|
    t.string   "associated_word", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "word_id",         limit: 4
  end

  add_index "word_forms", ["word_id"], name: "index_word_forms_on_word_id", using: :btree

  create_table "word_roots", force: :cascade do |t|
    t.string   "root_name",       limit: 255
    t.text     "root_definition", limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "word_roots_words", id: false, force: :cascade do |t|
    t.integer "word_id",      limit: 4, null: false
    t.integer "word_root_id", limit: 4, null: false
  end

  add_index "word_roots_words", ["word_id", "word_root_id"], name: "index_word_roots_words_on_word_id_and_word_root_id", using: :btree
  add_index "word_roots_words", ["word_root_id", "word_id"], name: "index_word_roots_words_on_word_root_id_and_word_id", using: :btree

  create_table "word_videos", force: :cascade do |t|
    t.string   "video_link",        limit: 255
    t.string   "video_description", limit: 255
    t.integer  "word_id",           limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "word_videos", ["word_id"], name: "index_word_videos_on_word_id", using: :btree

  create_table "words", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end


  add_foreign_key "lessons", "courses"
  add_foreign_key "word_forms", "words"
  add_foreign_key "word_videos", "words"
  add_foreign_key "definitions", "words"

end
