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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130611083736) do

  create_table "app_bookmarks", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "url"
    t.integer  "uid"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
  end

  create_table "favorites", :force => true do |t|
    t.integer  "position"
    t.integer  "app_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "loginid"
    t.boolean  "is_bookmark"
  end

end
