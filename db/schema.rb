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

ActiveRecord::Schema.define(:version => 20130418034710) do

  create_table "admins", :force => true do |t|
    t.string   "email",              :default => "", :null => false
    t.string   "encrypted_password", :default => "", :null => false
    t.integer  "sign_in_count",      :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",    :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
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
    t.string   "status",        :default => "Not Submitted",                 :null => false
    t.string   "comment",       :default => "Application has not submitted", :null => false
    t.datetime "created_at",                                                 :null => false
    t.datetime "updated_at",                                                 :null => false
    t.integer  "report_id"
  end

  create_table "managements", :force => true do |t|
    t.string   "email",              :default => "", :null => false
    t.string   "encrypted_password", :default => "", :null => false
    t.string   "management_name",                    :null => false
    t.string   "management_phone",                   :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "managers", :force => true do |t|
    t.string   "email",              :default => "",    :null => false
    t.string   "encrypted_password", :default => "",    :null => false
    t.string   "manager_name",                          :null => false
    t.string   "manager_phone",                         :null => false
    t.integer  "department_id",                         :null => false
    t.boolean  "admin",              :default => false, :null => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
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
    t.string   "staff_name",                         :null => false
    t.string   "staff_phone",                        :null => false
    t.integer  "department_id",                      :null => false
    t.integer  "leave_balance",      :default => 30
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

end
