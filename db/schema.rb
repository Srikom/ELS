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

ActiveRecord::Schema.define(:version => 20130418002053) do

  create_table "admins", :force => true do |t|
    t.string   "email",              :default => "", :null => false
    t.string   "encrypted_password", :default => "", :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "departments", :force => true do |t|
    t.string   "department_name", :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "leave_applications", :force => true do |t|
    t.integer  "staff_id",                                                   :null => false
    t.integer  "manager_id"
    t.integer  "management_id"
    t.date     "start_date",                                                 :null => false
    t.date     "end_date",                                                   :null => false
    t.text     "reason",                                                     :null => false
    t.string   "status",        :default => "Not Submitted"
    t.text     "comment",       :default => "Application has not Submitted"
    t.datetime "created_at",                                                 :null => false
    t.datetime "updated_at",                                                 :null => false
  end

  create_table "managements", :force => true do |t|
    t.string   "email",              :default => "", :null => false
    t.string   "encrypted_password", :default => "", :null => false
    t.string   "management_name"
    t.string   "management_phone"
    t.string   "management_email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "managers", :force => true do |t|
    t.string   "email",              :default => "", :null => false
    t.string   "encrypted_password", :default => "", :null => false
    t.string   "manager_name"
    t.string   "manager_phone"
    t.string   "manager_email"
    t.integer  "department_id"
    t.boolean  "admin"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "reports", :force => true do |t|
    t.string   "report_name",  :null => false
    t.string   "report_month", :null => false
    t.integer  "report_year",  :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "staffs", :force => true do |t|
    t.string   "email",              :default => "", :null => false
    t.string   "encrypted_password", :default => "", :null => false
    t.string   "staff_name"
    t.string   "staff_phone"
    t.string   "staff_email"
    t.integer  "department_id"
    t.integer  "leave_balance"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

end
