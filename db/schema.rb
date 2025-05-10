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

ActiveRecord::Schema[8.0].define(version: 2025_05_10_031623) do
  create_table "communities", force: :cascade do |t|
    t.string "name"
    t.text "descriptions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "community_members", force: :cascade do |t|
    t.integer "community_id", null: false
    t.integer "user_id", null: false
    t.datetime "joined_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_community_members_on_community_id"
    t.index ["user_id"], name: "index_community_members_on_user_id"
  end

  create_table "event_communities", force: :cascade do |t|
    t.integer "role"
    t.integer "user_id", null: false
    t.integer "community_id", null: false
    t.integer "event_id", null: false
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_event_communities_on_community_id"
    t.index ["event_id"], name: "index_event_communities_on_event_id"
    t.index ["user_id"], name: "index_event_communities_on_user_id"
  end

  create_table "event_details", force: :cascade do |t|
    t.datetime "date"
    t.datetime "start"
    t.datetime "finish"
    t.float "price"
    t.text "descriptions"
    t.integer "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_details_on_event_id"
  end

  create_table "event_schedules", force: :cascade do |t|
    t.string "title"
    t.integer "event_id", null: false
    t.time "start"
    t.time "finish"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_schedules_on_event_id"
    t.index ["user_id"], name: "index_event_schedules_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "date"
    t.integer "community_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_events_on_community_id"
  end

  create_table "finances", force: :cascade do |t|
    t.integer "community_id", null: false
    t.text "description"
    t.float "price"
    t.integer "period"
    t.float "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_finances_on_community_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.integer "role_id"
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "community_members", "communities"
  add_foreign_key "community_members", "users"
  add_foreign_key "event_communities", "communities"
  add_foreign_key "event_communities", "events"
  add_foreign_key "event_communities", "users"
  add_foreign_key "event_details", "events"
  add_foreign_key "event_schedules", "events"
  add_foreign_key "event_schedules", "users"
  add_foreign_key "events", "communities"
  add_foreign_key "finances", "communities"
  add_foreign_key "sessions", "users"
end
