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

ActiveRecord::Schema.define(version: 2022_01_14_161821) do

  create_table "assets", force: :cascade do |t|
    t.string "code"
    t.string "description"
    t.string "source"
    t.string "segment"
    t.string "company_name"
    t.string "national_registry"
    t.integer "asset_type"
    t.datetime "deleted_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "financial_transactions", force: :cascade do |t|
    t.integer "asset_id"
    t.integer "wallet_id"
    t.integer "financial_type"
    t.integer "quantity"
    t.decimal "unit_value", precision: 8, scale: 2
    t.decimal "tax", precision: 8, scale: 2
    t.datetime "transaction_date"
    t.datetime "deleted_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["asset_id"], name: "index_financial_transactions_on_asset_id", unique: true
    t.index ["wallet_id"], name: "index_financial_transactions_on_wallet_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "deleted_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wallets", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "status"
    t.integer "user_id"
    t.datetime "deleted_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

  create_table "wallets_assets", id: false, force: :cascade do |t|
    t.integer "wallet_id"
    t.integer "asset_id"
    t.index ["asset_id"], name: "index_wallets_assets_on_asset_id"
    t.index ["wallet_id"], name: "index_wallets_assets_on_wallet_id"
  end

  add_foreign_key "financial_transactions", "assets"
  add_foreign_key "financial_transactions", "wallets"
  add_foreign_key "wallets", "users"
end
