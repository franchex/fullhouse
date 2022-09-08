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

ActiveRecord::Schema[7.0].define(version: 2022_09_08_145805) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "assignments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "space_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "accepted", default: false, null: false
    t.index ["space_id"], name: "index_assignments_on_space_id"
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "bills", force: :cascade do |t|
    t.date "due_date"
    t.bigint "user_id", null: false
    t.bigint "space_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amount"
    t.string "category"
    t.index ["space_id"], name: "index_bills_on_space_id"
    t.index ["user_id"], name: "index_bills_on_user_id"
  end

  create_table "chores", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.date "due_date"
    t.bigint "space_id", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.index ["space_id"], name: "index_chores_on_space_id"
    t.index ["user_id"], name: "index_chores_on_user_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.integer "amount"
    t.bigint "space_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.index ["space_id"], name: "index_expenses_on_space_id"
    t.index ["user_id"], name: "index_expenses_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name", default: ""
    t.bigint "shopping_list_id", null: false
    t.boolean "done", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shopping_list_id"], name: "index_items_on_shopping_list_id"
  end

  create_table "shopping_lists", force: :cascade do |t|
    t.string "name"
    t.bigint "space_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["space_id"], name: "index_shopping_lists_on_space_id"
  end

  create_table "spaces", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.date "due_date"
    t.bigint "space_id", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["space_id"], name: "index_tasks_on_space_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "assignments", "spaces"
  add_foreign_key "assignments", "users"
  add_foreign_key "bills", "spaces"
  add_foreign_key "bills", "users"
  add_foreign_key "chores", "spaces"
  add_foreign_key "chores", "users"
  add_foreign_key "expenses", "spaces"
  add_foreign_key "expenses", "users"
  add_foreign_key "items", "shopping_lists"
  add_foreign_key "shopping_lists", "spaces"
  add_foreign_key "tasks", "spaces"
  add_foreign_key "tasks", "users"
end
