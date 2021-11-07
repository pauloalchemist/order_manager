# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_07_134440) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "states_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["states_id"], name: "index_cities_on_states_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.text "description", null: false
    t.string "sku", limit: 50, null: false
    t.bigint "supplier_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0, null: false
    t.index ["supplier_id"], name: "index_products_on_supplier_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "supplier_addresses", force: :cascade do |t|
    t.string "address", limit: 255, null: false
    t.bigint "supplier_id", null: false
    t.integer "number", null: false
    t.string "district", limit: 255, null: false
    t.bigint "cities_id", null: false
    t.bigint "states_id", null: false
    t.string "zipcode", limit: 255, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cities_id"], name: "index_supplier_addresses_on_cities_id"
    t.index ["states_id"], name: "index_supplier_addresses_on_states_id"
    t.index ["supplier_id"], name: "index_supplier_addresses_on_supplier_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "corporate_name", null: false
    t.string "fantasy_name"
    t.string "cnpj", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cities", "states", column: "states_id"
  add_foreign_key "products", "suppliers"
  add_foreign_key "supplier_addresses", "cities", column: "cities_id"
  add_foreign_key "supplier_addresses", "states", column: "states_id"
  add_foreign_key "supplier_addresses", "suppliers"
end
