class CreateMasterCirclesAuthorsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :master_circles_authors, id: false do |t|
      t.bigint :circle_id, null: false
      t.bigint :author_id, null: false

      t.index :circle_id
      t.index :author_id
      t.index [:circle_id, :author_id], name: :unique_index_circle_and_author, unique: true
    end
  end
end
