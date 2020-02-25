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

ActiveRecord::Schema.define(version: 2020_02_25_162449) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.string "unit"
    t.integer "quantity"
    t.bigint "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_ingredients_on_recipe_id"
  end

  create_table "liked_recipes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_liked_recipes_on_recipe_id"
    t.index ["user_id"], name: "index_liked_recipes_on_user_id"
  end

  create_table "planner_recipes", force: :cascade do |t|
    t.boolean "cooked"
    t.integer "servings"
    t.bigint "planner_id"
    t.bigint "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["planner_id"], name: "index_planner_recipes_on_planner_id"
    t.index ["recipe_id"], name: "index_planner_recipes_on_recipe_id"
  end

  create_table "planners", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_planners_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "rating"
    t.bigint "user_id"
    t.bigint "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_ratings_on_recipe_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "dish_type"
    t.string "dish_origin"
    t.integer "prep_time"
    t.integer "servings"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "shopping_lists", force: :cascade do |t|
    t.string "ingredient_name"
    t.integer "quantity"
    t.string "unit"
    t.boolean "bought"
    t.bigint "planner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["planner_id"], name: "index_shopping_lists_on_planner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "ingredients", "recipes"
  add_foreign_key "liked_recipes", "recipes"
  add_foreign_key "liked_recipes", "users"
  add_foreign_key "planner_recipes", "planners"
  add_foreign_key "planner_recipes", "recipes"
  add_foreign_key "planners", "users"
  add_foreign_key "ratings", "recipes"
  add_foreign_key "ratings", "users"
  add_foreign_key "recipes", "users"
  add_foreign_key "shopping_lists", "planners"
end
