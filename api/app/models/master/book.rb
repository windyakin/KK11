# == Schema Information
#
# Table name: master_books
#
#  id           :bigint           not null, primary key
#  title        :string(255)      not null
#  published_at :date             not null
#  coalition    :boolean          default(FALSE), not null
#  explicit     :boolean          default(FALSE), not null
#  book_size    :string(255)      not null
#  genre_id     :bigint
#  page         :integer          default(0), not null
#  tora_id      :string(12)
#  melon_id     :integer
#  booth_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_master_books_on_booth_id  (booth_id)
#  index_master_books_on_explicit  (explicit)
#  index_master_books_on_genre_id  (genre_id)
#  index_master_books_on_melon_id  (melon_id)
#  index_master_books_on_title     (title)
#  index_master_books_on_tora_id   (tora_id)
#

class Master::Book < ApplicationRecord
  has_and_belongs_to_many :circles, class_name: 'Master::Circle'
  has_and_belongs_to_many :authors, class_name: 'Master::Author', join_table: 'master_books_authors'

  enum book_size: { b5: 'b5', b6: 'b6', a5: 'a5', other: 'other' }

  validates_presence_of :title
  validates_presence_of :published_at
  validates_presence_of :book_size
  validates_presence_of :page
  validates_numericality_of :page, only_integer: true, greater_than: 0, less_than: 500
  validates_format_of :tora_id, with: /\A\d{12}\z/, allow_nil: true
  validates_numericality_of :melon_id, only_integer: true, greater_than: 0, allow_nil: true
  validates_numericality_of :booth_id, only_integer: true, greater_than: 0, allow_nil: true
end
