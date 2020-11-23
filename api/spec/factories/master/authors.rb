# == Schema Information
#
# Table name: master_authors
#
#  id          :bigint           not null, primary key
#  name        :string(255)      not null
#  name_kana   :string(255)      not null
#  description :text(65535)
#  twitter_id  :string(255)
#  pixiv_id    :string(255)
#  website_url :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_master_authors_on_name        (name)
#  index_master_authors_on_pixiv_id    (pixiv_id)
#  index_master_authors_on_twitter_id  (twitter_id)
#

FactoryBot.define do
  factory :master_author, class: 'Master::Author' do
    sequence(:name) { |number| "作者#{number}" }
    sequence(:name_kana) { |number| "さくしゃ#{number}" }
  end
end
