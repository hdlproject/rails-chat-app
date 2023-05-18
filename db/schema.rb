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

ActiveRecord::Schema.define(version: 2023_05_18_103055) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chats", force: :cascade do |t|
    t.string "message", null: false
    t.integer "read_count", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "sender_id", null: false
    t.bigint "room_id", null: false
    t.index ["room_id"], name: "index_chats_on_room_id"
    t.index ["sender_id"], name: "index_chats_on_sender_id"
  end

# Could not dump table "rooms" because of following StandardError
#   Unknown type 'room_type' for column 'room_type'

  create_table "rooms_users", id: false, force: :cascade do |t|
    t.bigint "room_id", null: false
    t.bigint "member_id", null: false
    t.index ["member_id"], name: "index_rooms_users_on_member_id"
    t.index ["room_id"], name: "index_rooms_users_on_room_id"
  end

  create_table "user_accesses", primary_key: "user_id", force: :cascade do |t|
    t.string "username", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["username"], name: "unique_username", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "is_online", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "chats", "rooms"
  add_foreign_key "chats", "users", column: "sender_id"
  add_foreign_key "rooms_users", "rooms"
  add_foreign_key "rooms_users", "users", column: "member_id"
  add_foreign_key "user_accesses", "users"
end
