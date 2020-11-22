require 'rails_helper'

RSpec.describe 'GET /v1/master/circles', type: :request do
  describe '正しくアイテムが取得できる' do
    let!(:master_circles) { create_list(:master_circle, 3) }
    let(:master_circle) { master_circles.first }

    context '1件のみ取得' do
      before { get '/v1/master/circles', params: { ids: [master_circle.id] } }
      specify do
        expect(response.body).to be_json.with_content({
          id: master_circle.id,
          name: master_circle.name,
          name_kana: master_circle.name_kana,
          description: master_circle.description
        }).at_path('data.0')
      end
      it { expect(response.body).to be_json.with_content(data: Expectations::ArrayWithSize[1]) }
    end

    context '複数件取得' do
      before { get '/v1/master/circles', params: { ids: [master_circles[0].id, master_circles[2].id] } }
      it { expect(response.body).to be_json.with_content({ id: master_circles[0].id }).at_path('data.0') }
      it { expect(response.body).to be_json.with_content({ id: master_circles[2].id }).at_path('data.1') }
      it { expect(response.body).to be_json.with_content(data: Expectations::ArrayWithSize[2]) }
    end
  end
end
