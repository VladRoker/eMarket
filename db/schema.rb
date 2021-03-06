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

ActiveRecord::Schema.define(version: 20170401230608) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "ancestry"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug_en",     null: false
    t.index ["ancestry"], name: "index_categories_on_ancestry"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "product_id", null: false
    t.text     "text",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "language",       null: false
    t.string   "name",           null: false
    t.string   "adress"
    t.string   "phone"
    t.string   "email"
    t.string   "company_name",   null: false
    t.string   "company_reg_nr", null: false
    t.string   "company_vat_nr", null: false
    t.text     "bank"
    t.text     "time_table"
    t.text     "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.text     "code"
    t.integer  "percent"
    t.decimal  "amount",     precision: 8, scale: 2
    t.integer  "user_id"
    t.boolean  "used_flag"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "coupons_products", id: false, force: :cascade do |t|
    t.integer "coupon_id"
    t.integer "product_id"
    t.index ["coupon_id"], name: "index_coupons_products_on_coupon_id"
    t.index ["product_id"], name: "index_coupons_products_on_product_id"
  end

  create_table "deliveries", force: :cascade do |t|
    t.string   "deliverable_type"
    t.integer  "deliverable_id"
    t.string   "country",          null: false
    t.string   "city",             null: false
    t.string   "address",          null: false
    t.string   "zip",              null: false
    t.text     "info"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["deliverable_type", "deliverable_id"], name: "index_deliveries_on_deliverable_type_and_deliverable_id"
  end

  create_table "impressions", force: :cascade do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "params"
    t.index ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
    t.index ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
    t.index ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
    t.index ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
    t.index ["impressionable_type", "impressionable_id", "params"], name: "poly_params_request_index"
    t.index ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
    t.index ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
    t.index ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index"
    t.index ["user_id"], name: "index_impressions_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.decimal  "price",      precision: 8, scale: 2, null: false
    t.string   "status",                             null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "coupon_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "orders_products", id: false, force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.index ["order_id"], name: "index_orders_products_on_order_id"
    t.index ["product_id"], name: "index_orders_products_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",                                                  null: false
    t.decimal  "price",         precision: 8, scale: 2,                 null: false
    t.decimal  "discount",      precision: 8, scale: 2
    t.boolean  "sale_flag",                             default: false, null: false
    t.text     "description"
    t.integer  "category_id",                                           null: false
    t.integer  "quantity",                              default: 0,     null: false
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.integer  "counter_cache"
    t.string   "image"
    t.string   "slug_en",                                               null: false
  end

  create_table "showcases", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "admin_flag",      default: false
  end

end
