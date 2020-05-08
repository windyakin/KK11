# == Schema Information
#
# Table name: master_circles
#
#  id          :bigint           not null, primary key
#  name        :string(255)      not null
#  name_kana   :string(255)      not null
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_master_circles_on_name  (name)
#

FactoryBot.define do
  factory :master_circle, class: 'Master::Circle' do
    sequence(:name) { |n| "サークル#{n}" }
    sequence(:name_kana) { |n| "さーくる#{n}" }
  end
end
