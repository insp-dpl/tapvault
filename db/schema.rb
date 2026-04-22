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

ActiveRecord::Schema[7.1].define(version: 2026_04_20_051544) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string "uid"
    t.bigint "customer_id"
    t.string "nickname"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_cards_on_customer_id"
    t.index ["uid"], name: "index_cards_on_uid", unique: true
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "stripe_customer_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "merchants", force: :cascade do |t|
    t.string "business_name", null: false
    t.string "phone"
    t.string "address"
    t.string "country"
    t.string "approval_status", default: "pending", null: false
    t.string "stripe_account_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_merchants_on_email", unique: true
    t.index ["reset_password_token"], name: "index_merchants_on_reset_password_token", unique: true
  end

  create_table "terminals", force: :cascade do |t|
    t.bigint "merchant_id", null: false
    t.string "device_identifier"
    t.string "name"
    t.string "status"
    t.datetime "last_seen_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_identifier"], name: "index_terminals_on_device_identifier", unique: true
    t.index ["merchant_id"], name: "index_terminals_on_merchant_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "merchant_id", null: false
    t.bigint "terminal_id", null: false
    t.bigint "card_id", null: false
    t.integer "amount_cents"
    t.string "currency"
    t.string "status"
    t.string "stripe_payment_intent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_transactions_on_card_id"
    t.index ["customer_id"], name: "index_transactions_on_customer_id"
    t.index ["merchant_id"], name: "index_transactions_on_merchant_id"
    t.index ["terminal_id"], name: "index_transactions_on_terminal_id"
  end

  add_foreign_key "cards", "customers"
  add_foreign_key "terminals", "merchants"
  add_foreign_key "transactions", "cards"
  add_foreign_key "transactions", "customers"
  add_foreign_key "transactions", "merchants"
  add_foreign_key "transactions", "terminals"
end
