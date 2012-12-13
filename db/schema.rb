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

ActiveRecord::Schema.define(:version => 20121212033043) do

  create_table "social_media_accounts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "social_media_site_id"
    t.string   "identifier"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "social_media_accounts", ["social_media_site_id"], :name => "index_social_media_accounts_on_social_media_site_id"
  add_index "social_media_accounts", ["user_id"], :name => "index_social_media_accounts_on_user_id"

  create_table "social_media_sites", :force => true do |t|
    t.string   "name"
    t.string   "homepage_url"
    t.string   "userbase_url"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "username"
    t.boolean  "admin"
    t.string   "password_digest"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
  end

end
