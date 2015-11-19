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

ActiveRecord::Schema.define(version: 20151119170625) do

  create_table "answer_options", force: :cascade do |t|
    t.integer  "question_id",    limit: 4
    t.integer  "lesson_word_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "answer_options", ["lesson_word_id"], name: "index_answer_options_on_lesson_word_id", using: :btree
  add_index "answer_options", ["question_id"], name: "index_answer_options_on_question_id", using: :btree

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id",      limit: 4
    t.integer  "user_id",          limit: 4
    t.integer  "time_to_complete", limit: 4
    t.boolean  "correct"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "course_emails", force: :cascade do |t|
    t.integer  "course_id",  limit: 4
    t.string   "title",      limit: 255
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id",    limit: 4
  end

  add_index "course_emails", ["course_id"], name: "index_course_emails_on_course_id", using: :btree
  add_index "course_emails", ["user_id"], name: "index_course_emails_on_user_id", using: :btree

  create_table "course_users", force: :cascade do |t|
    t.integer  "course_id",  limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "course_users", ["course_id"], name: "index_course_users_on_course_id", using: :btree
  add_index "course_users", ["user_id"], name: "index_course_users_on_user_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "class_name", limit: 255
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "definitions", force: :cascade do |t|
    t.text     "word_definition", limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "word_id",         limit: 4
  end

  add_index "definitions", ["word_id"], name: "index_definitions_on_word_id", using: :btree

  create_table "grade_modifers", force: :cascade do |t|
    t.integer  "user_id",              limit: 4
    t.integer  "lesson_id",            limit: 4
    t.integer  "course_id",            limit: 4
    t.integer  "lesson_module_id",     limit: 4
    t.integer  "question_id",          limit: 4
    t.float    "modified_grade_value", limit: 24
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "grade_modifers", ["course_id"], name: "index_grade_modifers_on_course_id", using: :btree
  add_index "grade_modifers", ["lesson_id"], name: "index_grade_modifers_on_lesson_id", using: :btree
  add_index "grade_modifers", ["lesson_module_id"], name: "index_grade_modifers_on_lesson_module_id", using: :btree
  add_index "grade_modifers", ["question_id"], name: "index_grade_modifers_on_question_id", using: :btree
  add_index "grade_modifers", ["user_id"], name: "index_grade_modifers_on_user_id", using: :btree

  create_table "lesson_modules", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.integer  "attempts",          limit: 4
    t.boolean  "in_use"
    t.integer  "value_percentage",  limit: 4
    t.integer  "lesson_id",         limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "number_of_answers", limit: 4
  end

  add_index "lesson_modules", ["lesson_id"], name: "index_lesson_modules_on_lesson_id", using: :btree

  create_table "lesson_word_definitions", force: :cascade do |t|
    t.integer  "lesson_word_id", limit: 4
    t.integer  "definition_id",  limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "lesson_word_definitions", ["definition_id"], name: "index_lesson_word_definitions_on_definition_id", using: :btree
  add_index "lesson_word_definitions", ["lesson_word_id"], name: "index_lesson_word_definitions_on_lesson_word_id", using: :btree

  create_table "lesson_word_forms", force: :cascade do |t|
    t.integer  "lesson_word_id", limit: 4
    t.integer  "word_form_id",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "lesson_word_forms", ["lesson_word_id"], name: "index_lesson_word_forms_on_lesson_word_id", using: :btree
  add_index "lesson_word_forms", ["word_form_id"], name: "index_lesson_word_forms_on_word_form_id", using: :btree

  create_table "lesson_word_sentences", force: :cascade do |t|
    t.integer  "lesson_word_id", limit: 4
    t.integer  "sentence_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "lesson_word_sentences", ["lesson_word_id"], name: "index_lesson_word_sentences_on_lesson_word_id", using: :btree
  add_index "lesson_word_sentences", ["sentence_id"], name: "index_lesson_word_sentences_on_sentence_id", using: :btree

  create_table "lesson_word_synonyms", force: :cascade do |t|
    t.integer  "lesson_word_id", limit: 4
    t.integer  "synonym_id",     limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "lesson_word_synonyms", ["lesson_word_id"], name: "index_lesson_word_synonyms_on_lesson_word_id", using: :btree
  add_index "lesson_word_synonyms", ["synonym_id"], name: "index_lesson_word_synonyms_on_synonym_id", using: :btree

  create_table "lesson_word_videos", force: :cascade do |t|
    t.integer  "lesson_word_id", limit: 4
    t.integer  "word_video_id",  limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "lesson_word_videos", ["lesson_word_id"], name: "index_lesson_word_videos_on_lesson_word_id", using: :btree
  add_index "lesson_word_videos", ["word_video_id"], name: "index_lesson_word_videos_on_word_video_id", using: :btree

  create_table "lesson_words", force: :cascade do |t|
    t.integer  "lesson_id",  limit: 4
    t.integer  "word_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "lesson_words", ["lesson_id"], name: "index_lesson_words_on_lesson_id", using: :btree
  add_index "lesson_words", ["word_id"], name: "index_lesson_words_on_word_id", using: :btree

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

  create_table "questions", force: :cascade do |t|
    t.integer  "lesson_module_id", limit: 4
    t.integer  "lesson_word_id",   limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "questions", ["lesson_module_id"], name: "index_questions_on_lesson_module_id", using: :btree
  add_index "questions", ["lesson_word_id"], name: "index_questions_on_lesson_word_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "root_managers", force: :cascade do |t|
    t.integer  "word_id",      limit: 4
    t.integer  "word_root_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "root_managers", ["word_id"], name: "index_root_managers_on_word_id", using: :btree
  add_index "root_managers", ["word_root_id"], name: "index_root_managers_on_word_root_id", using: :btree

  create_table "sentences", force: :cascade do |t|
    t.string   "word_sentence", limit: 255
    t.integer  "word_id",       limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "sentences", ["word_id"], name: "index_sentences_on_word_id", using: :btree

  create_table "synonyms", force: :cascade do |t|
    t.string   "word_synonym", limit: 255
    t.integer  "word_id",      limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "synonyms", ["word_id"], name: "index_synonyms_on_word_id", using: :btree

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

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "role_id", limit: 4
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

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

  add_foreign_key "answer_options", "lesson_words"
  add_foreign_key "answer_options", "questions"
  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "course_emails", "courses"
  add_foreign_key "course_users", "courses"
  add_foreign_key "course_users", "users"
  add_foreign_key "definitions", "words"
  add_foreign_key "grade_modifers", "courses"
  add_foreign_key "grade_modifers", "lesson_modules"
  add_foreign_key "grade_modifers", "lessons"
  add_foreign_key "grade_modifers", "questions"
  add_foreign_key "grade_modifers", "users"
  add_foreign_key "lesson_modules", "lessons"
  add_foreign_key "lesson_word_definitions", "definitions"
  add_foreign_key "lesson_word_definitions", "lesson_words"
  add_foreign_key "lesson_word_forms", "lesson_words"
  add_foreign_key "lesson_word_forms", "word_forms"
  add_foreign_key "lesson_word_sentences", "lesson_words"
  add_foreign_key "lesson_word_sentences", "sentences"
  add_foreign_key "lesson_word_synonyms", "lesson_words"
  add_foreign_key "lesson_word_synonyms", "synonyms"
  add_foreign_key "lesson_word_videos", "lesson_words"
  add_foreign_key "lesson_word_videos", "word_videos"
  add_foreign_key "lesson_words", "lessons"
  add_foreign_key "lesson_words", "words"
  add_foreign_key "lessons", "courses"
  add_foreign_key "questions", "lesson_modules"
  add_foreign_key "questions", "lesson_words"
  add_foreign_key "root_managers", "word_roots"
  add_foreign_key "root_managers", "words"
  add_foreign_key "sentences", "words"
  add_foreign_key "synonyms", "words"
  add_foreign_key "word_forms", "words"
  add_foreign_key "word_videos", "words"
end
