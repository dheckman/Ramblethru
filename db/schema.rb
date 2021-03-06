# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141214042810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authorizations", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authorizations", ["user_id"], name: "index_authorizations_on_user_id", using: :btree

  create_table "discovers", force: true do |t|
    t.string   "destination"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.integer  "discovers_id"
  end

  add_index "discovers", ["discovers_id"], name: "index_discovers_on_discovers_id", using: :btree

  create_table "logins", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", force: true do |t|
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ramble_id"
    t.string   "title"
    t.string   "address"
    t.string   "url"
    t.boolean  "share",      default: true, null: false
  end

  add_index "notes", ["ramble_id"], name: "index_notes_on_ramble_id", using: :btree

  create_table "rambles", force: true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "name",        default: "give your ramble a title!"
    t.string   "destination"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "slug"
    t.integer  "rambles_id"
  end

  add_index "rambles", ["rambles_id"], name: "index_rambles_on_rambles_id", using: :btree
  add_index "rambles", ["user_id"], name: "index_rambles_on_user_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "bio",                 default: "add a bio!"
    t.string   "lives_in",            default: "where do you live?"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "slug"
    t.integer  "user_id"
  end

  add_index "users", ["user_id"], name: "index_users_on_user_id", using: :btree

end
