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

ActiveRecord::Schema.define(version: 2020_05_18_052340) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "endusers", force: :cascade do |t|
    t.integer "enduser_cd", null: false
    t.string "todofuken"
    t.string "enduser_nm"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enduser_cd"], name: "index_endusers_on_enduser_cd", unique: true
  end

#   create_table "motoukes", force: :cascade do |t|
#     t.integer "motouke_cd", null: false
#     t.string "motouke_nm", null: false
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["motouke_cd"], name: "index_motoukes_on_motouke_cd", unique: true
#   end

#   create_table "tasks", force: :cascade do |t|
#     t.integer "dantai_kbn", null: false
#     t.string "todofuken"
#     t.integer "jigyou_kbn", null: false
#     t.string "kijyou", limit: 50
#     t.text "naiyou"
#     t.text "jisyou"
#     t.text "syochi"
#     t.text "biko"
#     t.string "syubetu_kbn"
#     t.string "hosyou_kbn"
#     t.date "renraku_d"
#     t.time "renraku_t"
#     t.float "syanai", default: 0.0
#     t.date "genchi_d"
#     t.time "genchi_t"
#     t.date "sagyou_d"
#     t.time "sagyou_t"
#     t.float "syagai", default: 0.0
#     t.float "idou", default: 0.0
#     t.float "teishi", default: 0.0
#     t.string "project_cd"
#     t.integer "taiou_cd", null: false
#     t.integer "taiou_sub"
#     t.integer "del_flg", default: 0, null: false
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.bigint "user_id", null: false
#     t.bigint "enduser_id", null: false
#     t.bigint "motouke_id", null: false
#     t.bigint "userkey_id", null: false
#     t.index ["enduser_id"], name: "index_tasks_on_enduser_id"
#     t.index ["motouke_id"], name: "index_tasks_on_motouke_id"
#     t.index ["userkey_id"], name: "index_tasks_on_userkey_id"
#     t.index ["naiyou"], name: "index_tasks_on_naiyou"
#     t.index ["renraku_d"], name: "index_tasks_on_renraku_d"
#     t.index ["sagyou_d"], name: "index_tasks_on_sagyou_d"
#     t.index ["taiou_cd"], name: "index_tasks_on_taiou_cd"
#     t.index ["user_id"], name: "index_tasks_on_user_id"
#   end

#   create_table "userkeys", force: :cascade do |t|
#     t.string "userkey_cd", null: false
#     t.string "userkey_nm"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["userkey_cd"], name: "index_userkeys_on_userkey_cd", unique: true
#   end

#   create_table "users", force: :cascade do |t|
#     t.string "name", null: false
#     t.string "name_id", null: false
#     t.string "password_digest", null: false
#     t.boolean "admin", default: false, null: false
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["name_id"], name: "index_users_on_name_id", unique: true
#   end

end
