# == Schema Information
#
# Table name: user_items
#
#  id          :bigint           not null, primary key
#  account_id  :bigint           not null
#  master_type :string(255)      not null
#  master_id   :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_user_items_on_account_id                                (account_id)
#  index_user_items_on_account_id_and_master_type_and_master_id  (account_id,master_type,master_id) UNIQUE
#  index_user_items_on_master_type_and_master_id                 (master_type,master_id)
#
FactoryBot.define do
  factory :user_item, class: 'User::Item' do
    # NOTE: FactoryBot 経由だと MySQL の SHORT_UUID の値をうまく取ってこれないみたいなので指定する
    sequence(:id)
    association :account

    trait :for_master_book do
      association :master, factory: :master_book
    end

    trait :with_master_book do
      # NOTE: association 関連付けした factory に指定したい trait は factory 指定より先に書く
      # https://github.com/thoughtbot/factory_bot/blob/v5.2.0/lib/factory_bot/declaration/association.rb
      association :master, :with_author_and_circle, factory: :master_book
    end
  end
end
