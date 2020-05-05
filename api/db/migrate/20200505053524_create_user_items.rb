class CreateUserItems < ActiveRecord::Migration[6.0]
  def change
    create_table :user_items, id: false do |t|
      t.bigint :id, primary_key: true, default: -> { "(uuid_short())" }
      t.references :account, null: false
      t.references :master, polymorphic: true, null: false

      t.timestamps

      t.index [:account_id, :master_type, :master_id], unique: true
    end
  end
end
