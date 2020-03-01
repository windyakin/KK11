# == Schema Information
#
# Table name: master_books
#
#  id           :bigint           not null, primary key
#  title        :string(255)      not null
#  published_at :date             not null
#  coalition    :boolean          default("0"), not null
#  explicit     :boolean          default("0"), not null
#  book_size    :string(255)      not null
#  genre_id     :bigint
#  page         :integer          default("0"), not null
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

require 'rails_helper'

RSpec.describe Master::Book, type: :model do
  describe 'associations' do
    it { should have_and_belong_to_many(:circles).class_name('Master::Circle') }
    it { should have_and_belong_to_many(:authors).class_name('Master::Author').join_table('master_books_authors') }
  end

  describe 'enum' do
    specify do
      should define_enum_for(:book_size).with_values(
        b5: 'b5', b6: 'b6', a5: 'a5', other: 'other'
      ).backed_by_column_of_type(:string)
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:published_at) }
    it { should validate_presence_of(:book_size) }
    it { should validate_presence_of(:page) }
    it { should validate_numericality_of(:page).only_integer.is_greater_than(0).is_less_than(500) }
    it { should allow_value('040030798615').for(:tora_id) }
    it { should_not allow_value('04098615').for(:tora_id) }
    it { should validate_numericality_of(:melon_id).only_integer.is_greater_than(0).allow_nil }
    it { should validate_numericality_of(:booth_id).only_integer.is_greater_than(0).allow_nil }
  end
end
