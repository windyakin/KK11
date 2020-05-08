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
    sequence(:title) { |n| "Book title #{n}" }
    published_at { '2019-12-31' }
    coalition { false }
    explicit { false }
    book_size { 'b5' }
    page { 10 }

    # NOTE: for callback evaluators
    transient do
      authors_count { 1 }
      circles_count { 1 }
    end

    trait :with_author_and_circle do
      after(:create) do |book|
        create(:master_author, circles: [create(:master_circle, books: [book])], books: [book])
      end
    end

    trait :with_authors do
      after(:create) do |book, evaluator|
        create_list(:master_author, evaluator.authors_count, books: [book])
      end
    end

    trait :with_circles do
      after(:create) do |book, evaluator|
        create_list(:master_circle, evaluator.circle_count, books: [book])
      end
    end
  end
end
