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

ActiveRecord::Schema.define(version: 2020_02_13_121653) do

  create_table "master_books", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "title", null: false
    t.date "published_at", null: false
    t.boolean "coalition", default: false, null: false
    t.boolean "explicit", default: false, null: false
    t.string "book_size", null: false
    t.bigint "genre_id"
    t.integer "page", default: 0, null: false
    t.string "tora_id", limit: 12
    t.integer "melon_id"
    t.integer "booth_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booth_id"], name: "index_master_books_on_booth_id"
    t.index ["explicit"], name: "index_master_books_on_explicit"
    t.index ["genre_id"], name: "index_master_books_on_genre_id"
    t.index ["melon_id"], name: "index_master_books_on_melon_id"
    t.index ["title"], name: "index_master_books_on_title"
    t.index ["tora_id"], name: "index_master_books_on_tora_id"
  end

end
