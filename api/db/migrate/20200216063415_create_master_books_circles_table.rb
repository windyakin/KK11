class CreateMasterBooksCirclesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :master_books_circles, id: false do |t|
      t.bigint :book_id, null: false
      t.bigint :circle_id, null: false

      t.index :book_id
      t.index :circle_id
      t.index [:book_id, :circle_id], name: :unique_index_book_and_circle, unique: true
    end
  end
end
