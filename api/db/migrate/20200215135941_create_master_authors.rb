class CreateMasterAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :master_authors do |t|
      t.string :name, null: false
      t.string :name_kana, null: false
      t.text :description

      t.string :twitter_id
      t.string :pixiv_id
      t.string :website_url

      t.index :name
      t.index :twitter_id
      t.index :pixiv_id

      t.timestamps
    end
  end
end
