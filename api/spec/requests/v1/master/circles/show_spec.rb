require 'rails_helper'

RSpec.describe 'GET /v1/master/circles/:id', type: :request do
  describe '正しくアイテムが取得できる' do
    let(:master_circle) { create(:master_circle) }

    context '取得' do
      before { get "/v1/master/circles/#{master_circle.id}" }
      specify do
        expect(response.body).to be_json.with_content({
          id: master_circle.id,
          name: master_circle.name,
          name_kana: master_circle.name_kana,
          description: master_circle.description
        }).at_path('data')
      end
    end
  end
end
