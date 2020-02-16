class CreateMasterBooksAuthorsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :master_books_authors, id: false do |t|
      t.bigint :book_id, null: false
      t.bigint :author_id, null: false

      t.index :book_id
      t.index :author_id
      t.index [:book_id, :author_id], name: :unique_index_book_and_author, unique: true
    end
  end
end
