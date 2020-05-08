require 'rails_helper'

RSpec.describe 'V1::User::Items', type: :request do
  let!(:account) { create(:account) }
  let(:auth_headers) { account_auth_headers(account) }
  let!(:user_item) { create(:user_item, :with_master_book, account: account) }

  describe 'GET /v1/user/items' do
    context 'authentication' do
      specify '認証系ヘッダを持っていないとき' do
        get '/v1/user/items', headers: {}
        expect(response).to have_http_status(401)
      end
    end

    context '所持アイテムの一覧を取得することができる' do
      let(:expected) {

      }
      specify 'アイテム一覧が返ってくる' do
        get '/v1/user/items', headers: auth_headers
        expect(response).to have_http_status(200)
        expect(response.body).to be_json_as({
          items: [{
            id: user_item.id,
            type: user_item.master_type.demodulize,
            master: {
              id: user_item.master.id,
              title: user_item.master.title,
              published_at: user_item.master.published_at.strftime('%Y-%m-%d'),
              coalition: user_item.master.coalition,
              explicit: user_item.master.explicit,
              book_size: user_item.master.book_size,
              tora_id: user_item.master.tora_id,
              melon_id: user_item.master.melon_id,
              booth_id: user_item.master.booth_id,
              authors: user_item.master.authors.map { |author|
                {
                  id: author.id,
                  name: author.name,
                  name_kana: author.name_kana,
                  description: author.description,
                  twitter_id: author.twitter_id,
                  pixiv_id: author.pixiv_id,
                  website_url: author.website_url
                }
              },
              circles: user_item.master.circles.map { |circle|
                {
                  id: circle.id,
                  name: circle.name,
                  name_kana: circle.name_kana,
                  description: circle.description,
                }
              }
            }
          }]
        })
      end
    end
  end
end
