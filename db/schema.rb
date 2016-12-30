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

ActiveRecord::Schema.define(version: 20161230131410) do

  create_table "categories", force: :cascade do |t|
    t.string   "category_name"
    t.text     "category_desc"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "categories_products", id: false, force: :cascade do |t|
    t.integer "product_id"
    t.integer "category_id"
    t.index ["category_id"], name: "index_categories_products_on_category_id"
    t.index ["product_id"], name: "index_categories_products_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "prodname"
    t.text     "description"
    t.integer  "price"
    t.integer  "ship_cost"
    t.integer  "stock"
    t.text     "img_path"
    t.datetime "lastUpdated"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id", "created_at"], name: "index_products_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.integer  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_purchases_on_product_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "reputations", force: :cascade do |t|
    t.integer  "reviewer_id"
    t.integer  "reviewee_id"
    t.integer  "rating"
    t.string   "comment"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["reviewee_id"], name: "index_reputations_on_reviewee_id"
    t.index ["reviewer_id"], name: "index_reputations_on_reviewer_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.text     "comment"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_reviews_on_product_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "address"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "wishlists", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.integer  "list_rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_wishlists_on_product_id"
    t.index ["user_id"], name: "index_wishlists_on_user_id"
  end

end
