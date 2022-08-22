# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_08_18_052851) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applicants", force: :cascade do |t|
    t.string "name", null: false
    t.string "email_id", null: false
    t.string "phone_no", null: false
    t.text "education_details", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_applications", force: :cascade do |t|
    t.bigint "recruiter_id", null: false
    t.bigint "applicant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "job_name", null: false
    t.text "job_description", null: false
    t.string "qualification", null: false
    t.date "last_date", null: false
    t.index ["applicant_id"], name: "index_job_applications_on_applicant_id"
    t.index ["recruiter_id"], name: "index_job_applications_on_recruiter_id"
  end

  create_table "recruiters", force: :cascade do |t|
    t.string "company_name", null: false
    t.string "company_id", null: false
    t.string "email_id", null: false
    t.string "phone_no", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "job_applications", "applicants"
  add_foreign_key "job_applications", "recruiters"
end
