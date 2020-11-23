require 'rails_helper'

RSpec.describe 'GET /v1/master/authors/:id', type: :request do
  describe '正しくアイテムが取得できる' do
    let(:master_author) { create(:master_author) }

    context '取得' do
      before { get "/v1/master/authors/#{master_author.id}" }
      specify do
        expect(response.body).to be_json.with_content({
          id: master_author.id,
          name: master_author.name,
          name_kana: master_author.name_kana,
          description: master_author.description,
          twitter_id: master_author.twitter_id,
          pixiv_id: master_author.pixiv_id,
          website_url: master_author.website_url,
        }).at_path('data')
      end
    end
  end
end
