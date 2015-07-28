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

ActiveRecord::Schema.define(version: 20150722083652) do

  create_table "article_images", force: true do |t|
    t.integer  "article_id",                    null: false
    t.binary   "picture",      limit: 16777216
    t.string   "content_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "article_images", ["article_id"], name: "index_article_images_on_article_id"

  create_table "articles", force: true do |t|
    t.string   "text"
    t.string   "title"
    t.string   "userid"
    t.date     "submitday"
    t.integer  "ordernumber"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "member_images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", force: true do |t|
    t.string   "name"
    t.string   "password"
    t.string   "password_confirmation"
    t.integer  "life"
    t.integer  "score"
    t.string   "email"
    t.boolean  "administrator",         default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "hashed_password"
  end

end
