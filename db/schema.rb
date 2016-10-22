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

ActiveRecord::Schema.define(version: 20161022133815) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "custom_emojis", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "url",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_reactions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "emoji_id"
    t.string   "message_uid"
    t.string   "action"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["action"], name: "index_user_reactions_on_action", using: :btree
    t.index ["emoji_id"], name: "index_user_reactions_on_emoji_id", using: :btree
    t.index ["message_uid"], name: "index_user_reactions_on_message_uid", using: :btree
    t.index ["user_id"], name: "index_user_reactions_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "uid"
    t.string   "name"
    t.string   "username"
    t.string   "title"
    t.string   "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "user_reactions", "custom_emojis", column: "emoji_id"
  add_foreign_key "user_reactions", "users"
end
