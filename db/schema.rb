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

ActiveRecord::Schema.define(:version => 20140225224212) do

  create_table "bathrooms", :force => true do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "lat"
    t.string   "long"
    t.string   "bathroom_type"
    t.string   "bathroom_privacy"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "tp_quality"
    t.string   "cost"
    t.text     "notes"
  end

  create_table "destinations", :force => true do |t|
    t.integer  "unique_id"
    t.string   "destination_type"
    t.string   "current_status"
    t.datetime "current_report_time"
    t.string   "lat"
    t.string   "long"
    t.string   "name"
    t.text     "description"
    t.string   "source"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "lot_size"
    t.text     "authorized_phones",   :default => ""
    t.text     "gmap_lat_lng",        :default => ""
  end

  add_index "destinations", ["unique_id"], :name => "index_destinations_on_unique_id", :unique => true

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "ratings", :force => true do |t|
    t.integer  "overall"
    t.integer  "cleanliness"
    t.integer  "comfort"
    t.integer  "tp"
    t.integer  "location"
    t.integer  "bathroom_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "ratings", ["bathroom_id"], :name => "index_ratings_on_bathroom_id"

  create_table "updates", :force => true do |t|
    t.integer  "destination_id"
    t.string   "source"
    t.string   "status"
    t.datetime "reported_at"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "updates", ["destination_id"], :name => "index_updates_on_destination_id"
  add_index "updates", ["source"], :name => "index_updates_on_source"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.text     "phones",                 :default => ""
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
