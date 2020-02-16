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

class Master::Author < ApplicationRecord
  has_and_belongs_to_many :books, -> { readonly }, class_name: 'Master::Book', join_table: 'master_books_authors'
  has_and_belongs_to_many :circles, class_name: 'Master::Circle', join_table: 'master_circles_authors'

  validates_presence_of :name
  validates_presence_of :name_kana
  validates_format_of :name_kana, with: /\A[a-zA-Z0-9ぁ-ゔ\ー\u0020]+\z/
  validates_format_of :twitter_id, with: /\A[a-zA-Z0-9_]+\z/, allow_nil: true
  validates_format_of :pixiv_id, with: /\A[0-9]+\z/, allow_nil: true
  validates_format_of :website_url, with: /\Ahttps?:\/\/.+/, allow_nil: true
end
