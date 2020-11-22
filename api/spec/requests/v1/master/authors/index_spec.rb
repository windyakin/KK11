require 'rails_helper'

RSpec.describe 'GET /v1/master/authors', type: :request do
  describe '正しくアイテムが取得できる' do
    let!(:master_authors) { create_list(:master_author, 3) }
    let(:master_author) { master_authors.first }

    context '1件のみ取得' do
      before { get '/v1/master/authors', params: { ids: [master_author.id] } }
      specify do
        expect(response.body).to be_json.with_content({
          id: master_author.id,
          name: master_author.name,
          name_kana: master_author.name_kana,
          description: master_author.description,
          twitter_id: master_author.twitter_id,
          pixiv_id: master_author.pixiv_id,
          website_url: master_author.website_url,
        }).at_path('data.0')
      end
      it { expect(response.body).to be_json.with_content(data: Expectations::ArrayWithSize[1]) }
    end

    context '複数件取得' do
      before { get '/v1/master/authors', params: { ids: [master_authors[0].id, master_authors[2].id] } }
      it { expect(response.body).to be_json.with_content({ id: master_authors[0].id }).at_path('data.0') }
      it { expect(response.body).to be_json.with_content({ id: master_authors[2].id }).at_path('data.1') }
      it { expect(response.body).to be_json.with_content(data: Expectations::ArrayWithSize[2]) }
    end
  end
end
