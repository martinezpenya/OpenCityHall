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

ActiveRecord::Schema.define(version: 20160222094252) do

  create_table "access_visits", force: true do |t|
    t.integer  "year"
    t.date     "datetime"
    t.integer  "admin_user_id"
    t.integer  "common_id_type_id"
    t.string   "id_doc"
    t.string   "name"
    t.string   "motivation"
    t.time     "enter_datetime"
    t.time     "exit_datetime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "active_admin_comments", force: true do |t|
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_admin_notes_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "admin"
    t.string   "name"
    t.string   "initials"
    t.string   "roles"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "common_id_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "omic_ages", force: true do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "omic_claims", force: true do |t|
    t.integer  "year"
    t.datetime "datetime"
    t.text     "facts"
    t.text     "documents"
    t.text     "pretensions"
    t.text     "notes"
    t.integer  "omic_petitioner_id"
    t.integer  "omic_reclaimed_id"
    t.integer  "omic_result_id"
    t.integer  "admin_user_id"
    t.integer  "omic_sector_id"
    t.integer  "omic_reason_id"
    t.integer  "omic_mean_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.boolean  "open"
    t.integer  "omic_situation_id"
  end

  add_index "omic_claims", ["admin_user_id"], name: "index_omic_claims_on_admin_user_id", using: :btree
  add_index "omic_claims", ["omic_mean_id"], name: "index_omic_claims_on_omic_mean_id", using: :btree
  add_index "omic_claims", ["omic_petitioner_id"], name: "index_omic_claims_on_omic_petitioner_id", using: :btree
  add_index "omic_claims", ["omic_reason_id"], name: "index_omic_claims_on_omic_reason_id", using: :btree
  add_index "omic_claims", ["omic_reclaimed_id"], name: "index_omic_claims_on_omic_reclaimed_id", using: :btree
  add_index "omic_claims", ["omic_result_id"], name: "index_omic_claims_on_omic_result_id", using: :btree
  add_index "omic_claims", ["omic_sector_id"], name: "index_omic_claims_on_omic_sector_id", using: :btree

  create_table "omic_means", force: true do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "omic_petitioners", force: true do |t|
    t.string   "firstname"
    t.string   "surname1"
    t.string   "surname2"
    t.integer  "common_id_type_id"
    t.string   "id_doc"
    t.string   "address"
    t.string   "cp"
    t.string   "town"
    t.string   "province"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "email"
    t.text     "notes"
    t.integer  "omic_age_id"
    t.boolean  "sex"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "omic_petitioners", ["common_id_type_id"], name: "index_omic_petitioners_on_common_id_type_id", using: :btree
  add_index "omic_petitioners", ["omic_age_id"], name: "index_omic_petitioners_on_omic_age_id", using: :btree

  create_table "omic_queries", force: true do |t|
    t.datetime "datetime"
    t.text     "notes"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "omic_sector_id"
    t.integer  "omic_service_id"
    t.integer  "omic_reason_id"
    t.boolean  "open"
    t.integer  "admin_user_id"
    t.integer  "omic_mean_id"
  end

  create_table "omic_reasons", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "omic_reclaimeds", force: true do |t|
    t.string   "social_name"
    t.integer  "common_id_type_id"
    t.string   "id_doc"
    t.string   "address"
    t.string   "cp"
    t.string   "town"
    t.string   "province"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "fax"
    t.string   "email"
    t.text     "notes"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "comercial_name"
  end

  add_index "omic_reclaimeds", ["common_id_type_id"], name: "index_omic_reclaimeds_on_common_id_type_id", using: :btree

  create_table "omic_results", force: true do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "description"
  end

  create_table "omic_sectors", force: true do |t|
    t.string   "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "response_time"
  end

  create_table "omic_services", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "omic_situations", force: true do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
  end

end
