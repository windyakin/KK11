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

ActiveRecord::Schema.define(version: 2020_02_29_081725) do

  create_table "accounts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_accounts_on_confirmation_token", unique: true
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_accounts_on_uid_and_provider", unique: true
  end

  create_table "master_authors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_kana", null: false
    t.text "description"
    t.string "twitter_id"
    t.string "pixiv_id"
    t.string "website_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_master_authors_on_name"
    t.index ["pixiv_id"], name: "index_master_authors_on_pixiv_id"
    t.index ["twitter_id"], name: "index_master_authors_on_twitter_id"
  end

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

  create_table "master_books_authors", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "author_id", null: false
    t.index ["author_id"], name: "index_master_books_authors_on_author_id"
    t.index ["book_id", "author_id"], name: "unique_index_book_and_author", unique: true
    t.index ["book_id"], name: "index_master_books_authors_on_book_id"
  end

  create_table "master_books_circles", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "circle_id", null: false
    t.index ["book_id", "circle_id"], name: "unique_index_book_and_circle", unique: true
    t.index ["book_id"], name: "index_master_books_circles_on_book_id"
    t.index ["circle_id"], name: "index_master_books_circles_on_circle_id"
  end

  create_table "master_circles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_kana", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_master_circles_on_name"
  end

  create_table "master_circles_authors", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "circle_id", null: false
    t.bigint "author_id", null: false
    t.index ["author_id"], name: "index_master_circles_authors_on_author_id"
    t.index ["circle_id", "author_id"], name: "unique_index_circle_and_author", unique: true
    t.index ["circle_id"], name: "index_master_circles_authors_on_circle_id"
  end

end
