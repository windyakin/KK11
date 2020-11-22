require 'rails_helper'

RSpec.describe 'GET /v1/master/books', type: :request do
  describe '正しくアイテムが取得できる' do
    let!(:master_books) { create_list(:master_book_with_creators, 3) }
    let(:master_book) { master_books.first }

    context '1件のみ取得' do
      before { get '/v1/master/books', params: { ids: [master_book.id] } }
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
        }).at_path('data.0')
      end
      it { expect(response.body).to be_json.with_content(data: Expectations::ArrayWithSize[1]) }
    end

    context '複数件取得' do
      before { get '/v1/master/books', params: { ids: [master_books[0].id, master_books[2].id] } }
      it { expect(response.body).to be_json.with_content({ id: master_books[0].id }).at_path('data.0') }
      it { expect(response.body).to be_json.with_content({ id: master_books[2].id }).at_path('data.1') }
      it { expect(response.body).to be_json.with_content(data: Expectations::ArrayWithSize[2]) }
    end
  end
end
