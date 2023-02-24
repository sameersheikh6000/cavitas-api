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

ActiveRecord::Schema[7.0].define(version: 2023_02_24_122943) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "client_infos", force: :cascade do |t|
    t.string "subject"
    t.string "description"
    t.string "body"
    t.integer "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_client_infos_on_user_id"
  end

  create_table "rejected_files", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "client_info_id", null: false
    t.string "reason_of_rejection"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_info_id"], name: "index_rejected_files_on_client_info_id"
    t.index ["user_id"], name: "index_rejected_files_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.integer "role", default: 1
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "client_infos", "users"
  add_foreign_key "rejected_files", "client_infos"
  add_foreign_key "rejected_files", "users"
end
