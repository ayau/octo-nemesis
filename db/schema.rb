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

ActiveRecord::Schema.define(:version => 20121017230800) do

  create_table "cpratings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "rush_id"
    t.integer  "chill"
    t.integer  "pull"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "friendships", :force => true do |t|
    t.integer "rush_id"
    t.integer "friend_id"
  end

  create_table "rush_comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "rush_id"
    t.integer  "tag_id"
    t.string   "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rushes", :force => true do |t|
    t.string   "name"
    t.string   "photo"
    t.string   "email"
    t.string   "phone"
    t.string   "residence"
    t.string   "origin"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "primary_contact_id"
  end

  create_table "tags", :force => true do |t|
    t.integer  "tag_id"
    t.string   "type"
    t.string   "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "uid"
    t.string   "token"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "remember_token"
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
