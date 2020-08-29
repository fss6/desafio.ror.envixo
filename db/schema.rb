# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_28_193442) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_comments", force: :cascade do |t|
    t.text "content"
    t.string "locale"
    t.boolean "verified", default: false
    t.bigint "commentable_id"
    t.string "commentable_type"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["commentable_type", "commentable_id"], name: "index_admin_comments_on_commentable_type_and_commentable_id"
    t.index ["user_id"], name: "index_admin_comments_on_user_id"
  end

  create_table "admin_friends", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "friend_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["friend_id"], name: "index_admin_friends_on_friend_id"
    t.index ["user_id"], name: "index_admin_friends_on_user_id"
  end

  create_table "admin_news", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.text "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_admin_news_on_user_id"
  end

  create_table "admin_news_tags", id: false, force: :cascade do |t|
    t.bigint "admin_news_id", null: false
    t.bigint "admin_tag_id", null: false
  end

  create_table "admin_scores", force: :cascade do |t|
    t.integer "value"
    t.bigint "scoreable_id"
    t.string "scoreable_type"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["scoreable_type", "scoreable_id"], name: "index_admin_scores_on_scoreable_type_and_scoreable_id"
    t.index ["user_id"], name: "index_admin_scores_on_user_id"
  end

  create_table "admin_tags", force: :cascade do |t|
    t.string "name"
    t.string "locale"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["locale"], name: "index_admin_tags_on_locale"
    t.index ["user_id"], name: "index_admin_tags_on_user_id"
  end

  create_table "admin_tags_videos", id: false, force: :cascade do |t|
    t.bigint "admin_video_id", null: false
    t.bigint "admin_tag_id", null: false
    t.index ["admin_tag_id", "admin_video_id"], name: "index_admin_tags_videos_on_admin_tag_id_and_admin_video_id"
    t.index ["admin_video_id", "admin_tag_id"], name: "index_admin_tags_videos_on_admin_video_id_and_admin_tag_id"
  end

  create_table "admin_videos", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_admin_videos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.boolean "admin", default: false
    t.integer "default_locale", default: 0
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_videos_on_user_id"
  end

  add_foreign_key "admin_comments", "users"
  add_foreign_key "admin_friends", "users"
  add_foreign_key "admin_friends", "users", column: "friend_id"
  add_foreign_key "admin_news", "users"
  add_foreign_key "admin_scores", "users"
  add_foreign_key "admin_tags", "users"
  add_foreign_key "admin_videos", "users"
  add_foreign_key "videos", "users"
end
