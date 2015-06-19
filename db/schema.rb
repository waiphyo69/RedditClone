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

ActiveRecord::Schema.define(version: 20150619151738) do

  create_table "subs", force: :cascade do |t|
    t.string  "title"
    t.string  "description"
    t.integer "moderator_id"
  end

  add_index "subs", ["description"], name: "index_subs_on_description"
  add_index "subs", ["moderator_id"], name: "index_subs_on_moderator_id"
  add_index "subs", ["title"], name: "index_subs_on_title"

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "session_token"
  end

end
