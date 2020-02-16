class CreateMasterCircles < ActiveRecord::Migration[6.0]
  def change
    create_table :master_circles do |t|
      t.string :name, null: false
      t.string :name_kana, null: false
      t.text :description

      t.index :name

      t.timestamps
    end
  end
end
