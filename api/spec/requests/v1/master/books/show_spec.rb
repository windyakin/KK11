require 'rails_helper'

RSpec.describe 'GET /v1/master/books/:id', type: :request do
  describe '正しくアイテムが取得できる' do
    let!(:master_book) { create(:master_book) }

    context '取得' do
      before { get "/v1/master/books/#{master_book.id}" }
      specify do
        expect(response.body).to be_json.with_content({
          id: master_book.id,
          title: master_book.title,
          published_at: master_book.published_at.iso8601,
          coalition: master_book.coalition,
          explicit: master_book.explicit,
          book_size: master_book.book_size,
          author_ids: master_book.author_ids,
          circle_ids: master_book.circle_ids,
          melon_id: master_book.melon_id,
          tora_id: master_book.tora_id,
          booth_id: master_book.booth_id
        }).at_path('data')
      end
    end
  end
end
