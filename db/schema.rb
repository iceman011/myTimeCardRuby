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

ActiveRecord::Schema.define(version: 2021_11_10_153148) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.integer "clm_work_item_id"
    t.integer "task_type_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.time "duration"
    t.string "comment"
    t.bigint "emp_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["emp_id"], name: "index_cards_on_emp_id"
  end

  create_table "clm_work_items", force: :cascade do |t|
    t.integer "clm_parent_ref"
    t.integer "clm_child_ref"
    t.string "clm_title"
    t.string "clm_workitem_type"
    t.string "clm_impl_team"
    t.string "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "emps", force: :cascade do |t|
    t.string "user_name"
    t.integer "employee_id"
    t.integer "role"
    t.string "email"
    t.boolean "isManager"
    t.string "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  create_table "entries", force: :cascade do |t|
    t.integer "clm_work_item_id"
    t.integer "task_type_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.time "duration"
    t.string "comment"
    t.integer "card_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "task_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tests", force: :cascade do |t|
    t.string "comment"
    t.bigint "card_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_id"], name: "index_tests_on_card_id"
  end

  add_foreign_key "cards", "emps"
end
