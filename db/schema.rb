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

ActiveRecord::Schema[7.0].define(version: 2022_07_21_185713) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crews", force: :cascade do |t|
    t.bigint "members_id", null: false
    t.bigint "ships_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["members_id"], name: "index_crews_on_members_id"
    t.index ["ships_id"], name: "index_crews_on_ships_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.date "birth"
    t.string "license_number"
    t.string "doc_number"
    t.string "doc_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "occurrences", force: :cascade do |t|
    t.string "occurrence_date"
    t.string "occurrence_time"
    t.string "last_name"
    t.float "latitude"
    t.float "longitude"
    t.string "ship_origin"
    t.string "ship_destination"
    t.string "occurrence_type"
    t.bigint "user_id", null: false
    t.bigint "ship_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ship_id"], name: "index_occurrences_on_ship_id"
    t.index ["user_id"], name: "index_occurrences_on_user_id"
  end

  create_table "ships", force: :cascade do |t|
    t.string "name"
    t.string "registration"
    t.string "registration_port"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin"
    t.string "cpf"
    t.string "number"
    t.string "division"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "crews", "members", column: "members_id"
  add_foreign_key "crews", "ships", column: "ships_id"
  add_foreign_key "occurrences", "ships"
  add_foreign_key "occurrences", "users"
end
