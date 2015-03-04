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

ActiveRecord::Schema.define(version: 20150303182647) do

  create_table "article_templates", force: :cascade do |t|
    t.string   "name"
    t.string   "html"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "name"
    t.text     "body"
    t.string   "display_img_file_name"
    t.string   "display_img_content_type"
    t.integer  "display_img_file_size"
    t.datetime "display_img_updated_at"
    t.string   "news_img_file_name"
    t.string   "news_img_content_type"
    t.integer  "news_img_file_size"
    t.datetime "news_img_updated_at"
    t.integer  "author_id"
    t.integer  "article_template_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "articles", ["article_template_id"], name: "index_articles_on_article_template_id"
  add_index "articles", ["author_id"], name: "index_articles_on_author_id"

  create_table "authors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
