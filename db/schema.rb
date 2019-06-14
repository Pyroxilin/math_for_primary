# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_06_14_050106) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "examinees", force: :cascade do |t|
    t.string "username", null: false
    t.bigint "exam_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exam_id"], name: "index_examinees_on_exam_id"
  end

  create_table "exams", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title", null: false
    t.datetime "started_at"
    t.integer "status", default: 0, null: false
    t.integer "task_set_id", null: false
    t.string "session_token", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["session_token"], name: "index_exams_on_session_token", unique: true
    t.index ["user_id"], name: "index_exams_on_user_id"
  end

  create_table "submissions", force: :cascade do |t|
    t.bigint "examinee_id", null: false
    t.bigint "exam_id", null: false
    t.integer "task_id", null: false
    t.string "contents", null: false, array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exam_id", "examinee_id", "task_id"], name: "index_submissions_on_exam_id_and_examinee_id_and_task_id", unique: true
    t.index ["exam_id"], name: "index_submissions_on_exam_id"
    t.index ["examinee_id"], name: "index_submissions_on_examinee_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "examinees", "exams"
  add_foreign_key "exams", "users"
  add_foreign_key "submissions", "examinees"
  add_foreign_key "submissions", "exams"
end
