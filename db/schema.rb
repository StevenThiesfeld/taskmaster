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

ActiveRecord::Schema.define(:version => 20150326144607) do

  create_table "comments", :force => true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "task_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.text     "name"
    t.text     "status"
    t.datetime "time_closed"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tasks", :force => true do |t|
    t.text     "title"
    t.text     "body"
    t.integer  "user_id"
    t.integer  "created_by"
    t.integer  "project_id"
    t.text     "priority"
    t.text     "status"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "row_ordering"
    t.integer  "task_number"
  end

  create_table "users", :force => true do |t|
    t.text     "name"
    t.text     "password_digest"
    t.text     "clearance"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
