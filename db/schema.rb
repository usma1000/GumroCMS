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

ActiveRecord::Schema.define(version: 20151214145449) do

  create_table "carriers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "exp_in_retail"
    t.boolean  "exp_in_intl_cargo"
    t.boolean  "exp_in_garments_on_hangars"
    t.boolean  "exp_in_noncommercial_goods"
    t.boolean  "exp_in_replenishment"
    t.boolean  "exp_in_shop_returns"
    t.boolean  "two_year_contract"
    t.boolean  "operate_year_round"
    t.boolean  "handle_cosmetic_products"
    t.boolean  "accept_payment_in_thirty_days"
    t.string   "comments"
    t.string   "nda_file_name"
    t.string   "nda_content_type"
    t.integer  "nda_file_size"
    t.datetime "nda_updated_at"
    t.string   "contract_file_name"
    t.string   "contract_content_type"
    t.integer  "contract_file_size"
    t.datetime "contract_updated_at"
    t.boolean  "sort_and_segregate"
    t.boolean  "pool_distribution"
    t.boolean  "participate_in_recycling_programs"
    t.boolean  "scanning"
    t.string   "scanning_software"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "author"
    t.text     "body"
    t.integer  "carrier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["carrier_id"], name: "index_comments_on_carrier_id"

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "carrier_id"
    t.string   "comments"
  end

  add_index "contacts", ["carrier_id"], name: "index_contacts_on_carrier_id"

  create_table "facilities", force: :cascade do |t|
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "carrier_id"
    t.boolean  "has_security"
    t.boolean  "has_CCTV"
    t.boolean  "has_fence"
    t.boolean  "has_sprinklers"
    t.boolean  "has_fire_alarm"
    t.boolean  "has_burglar_alarm"
    t.boolean  "has_drop_yard"
    t.integer  "terminal_door_count"
    t.string   "hours_of_operation"
    t.boolean  "has_GPS"
    t.boolean  "has_alternate_fuel"
    t.boolean  "has_standard_equipment_types"
    t.integer  "average_equipment_age"
    t.boolean  "drivers_are_screened"
    t.boolean  "has_high_driver_turnover"
    t.boolean  "holds_driver_training"
    t.integer  "average_theft_rate"
    t.integer  "vehicle_count_24"
    t.integer  "vehicle_count_26"
    t.integer  "vehicle_count_48"
    t.integer  "vehicle_count_53"
    t.integer  "vehicle_count_sprinter_vans"
    t.integer  "vehicle_count_flat_beds"
    t.integer  "vehicle_count_reefers"
    t.boolean  "separate_caged_area_for_gas_tanks"
    t.boolean  "driver_scan"
    t.boolean  "independant_contractors"
    t.boolean  "company_drivers"
    t.string   "ratio_independant_company"
    t.integer  "size"
  end

  add_index "facilities", ["carrier_id"], name: "index_facilities_on_carrier_id"

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.string   "carrier_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
