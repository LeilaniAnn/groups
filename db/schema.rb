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

ActiveRecord::Schema.define(version: 20160304163608) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "amenities"
    t.integer  "place_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["place_id"], name: "index_categories_on_place_id", using: :btree

  create_table "gestures", force: true do |t|
    t.text     "data",                   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name",       limit: nil
  end

  create_table "groups", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["member_id"], name: "index_groups_on_member_id", using: :btree

  create_table "members", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memberships", force: true do |t|
    t.integer  "member_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memberships", ["group_id"], name: "index_memberships_on_group_id", using: :btree
  add_index "memberships", ["member_id"], name: "index_memberships_on_member_id", using: :btree

  create_table "place_categories", force: true do |t|
    t.integer  "place_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "place_categories", ["category_id"], name: "index_place_categories_on_category_id", using: :btree
  add_index "place_categories", ["place_id"], name: "index_place_categories_on_place_id", using: :btree

  create_table "place_types", force: true do |t|
    t.integer  "type_id"
    t.integer  "place_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "place_types", ["place_id"], name: "index_place_types_on_place_id", using: :btree
  add_index "place_types", ["type_id"], name: "index_place_types_on_type_id", using: :btree

  create_table "places", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.integer  "user_id"
    t.integer  "type_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "places", ["category_id"], name: "index_places_on_category_id", using: :btree
  add_index "places", ["type_id"], name: "index_places_on_type_id", using: :btree
  add_index "places", ["user_id"], name: "index_places_on_user_id", using: :btree

  create_table "playbacks", force: true do |t|
    t.string   "name",       limit: nil
    t.text     "data"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "reviews", force: true do |t|
    t.text     "description"
    t.integer  "stars"
    t.integer  "user_id"
    t.integer  "place_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["place_id"], name: "index_reviews_on_place_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "types", force: true do |t|
    t.string   "gender"
    t.integer  "place_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "types", ["place_id"], name: "index_types_on_place_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "handle"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
