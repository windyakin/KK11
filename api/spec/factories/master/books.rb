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
    sequence(:title) { |number| "Book#{number}" }
    published_at { '2020-01-01' }
    coalition { false }
    explicit { false }
    book_size { 'b5' }
    page { 20 }

    factory :master_book_with_creators do
      transient do
        authors_count { 1 }
        circles_count { 1 }
      end

      after(:create) do |book, evaluator|
        create_list(:master_author, evaluator.authors_count, books: [book])
        create_list(:master_circle, evaluator.circles_count, books: [book])
        book.reload
      end
    end
  end
end
