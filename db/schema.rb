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

ActiveRecord::Schema.define(version: 20180513183444) do

  create_table "appointments", force: :cascade do |t|
    t.datetime "timeanddate"
    t.integer  "dentist_id"
    t.integer  "patient_id"
    t.integer  "appointment_length"
    t.decimal  "fee_paid"
    t.string   "notes"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "appointments", ["dentist_id"], name: "index_appointments_on_dentist_id"
  add_index "appointments", ["patient_id"], name: "index_appointments_on_patient_id"

  create_table "contact_messages", force: :cascade do |t|
    t.string   "name"
    t.string   "phone_no"
    t.string   "email"
    t.string   "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dentists", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_no"
    t.string   "registered_dental_no"
    t.boolean  "isActive"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_no"
    t.string   "allergies"
    t.string   "medical_notes"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "username"
    t.string   "password"
    t.integer  "loginType"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
