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

ActiveRecord::Schema[7.1].define(version: 2024_04_20_133927) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doctors", force: :cascade do |t|
    t.string "crm"
    t.string "crm_state"
    t.string "full_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "examinations", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "doctor_id", null: false
    t.string "token"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_examinations_on_doctor_id"
    t.index ["patient_id"], name: "index_examinations_on_patient_id"
  end

  create_table "lab_test_results", force: :cascade do |t|
    t.bigint "examination_id", null: false
    t.bigint "lab_test_id", null: false
    t.string "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["examination_id"], name: "index_lab_test_results_on_examination_id"
    t.index ["lab_test_id"], name: "index_lab_test_results_on_lab_test_id"
  end

  create_table "lab_tests", force: :cascade do |t|
    t.string "name"
    t.string "limits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "cpf"
    t.string "full_name"
    t.string "email"
    t.date "birth_date"
    t.string "address"
    t.string "city"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "examinations", "doctors"
  add_foreign_key "examinations", "patients"
  add_foreign_key "lab_test_results", "examinations"
  add_foreign_key "lab_test_results", "lab_tests"
end
