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

FactoryBot.define do
  factory :master_book, class: 'Master::Book' do
    
  end
end
