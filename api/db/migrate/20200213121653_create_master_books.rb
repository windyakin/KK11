class CreateMasterBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :master_books do |t|
      t.string :title, null: false
      t.date :published_at, null: false
      t.boolean :coalition, default: false, null: false
      t.boolean :explicit, default: false, null: false
      t.string :book_size, null: false
      t.bigint :genre_id
      t.integer :page, default: 0, null: false
      t.string :tora_id, limit: 12, unique: true
      t.integer :melon_id, unique: true
      t.integer :booth_id, unique: true

      t.index :title
      t.index :explicit
      t.index :genre_id
      t.index :tora_id
      t.index :melon_id
      t.index :booth_id

      t.timestamps
    end
  end
end
