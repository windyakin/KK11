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

class Master::Circle < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :name_kana
  validates_format_of :name_kana, with: /\A[a-zA-Z0-9ぁ-ゔ\ー\u0020]+\z/
end
