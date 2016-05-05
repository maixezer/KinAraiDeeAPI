require 'rails_helper'

RSpec.describe Api::V1::FoodsController, type: :controller do
  let(:application) { FactoryGirl.create(:origin_application) }
  let(:user) { FactoryGirl.create(:user) }
  let(:access_token) { FactoryGirl.create(:access_token, application: application, resource_owner_id: user.id) }
  let!(:foods) { (0..6).map { FactoryGirl.create(:food) } }

  before { request.accept = 'application/json' }

  describe 'GET #index' do
    context 'when no filters are applied' do
      before { get :index, params: {access_token: access_token.token} }

      it { expect(response).to have_http_status(:ok) }
    end

    context 'random food by filter query [min and max calories]' do
      before { get :index, params: {min_calories: '234', max_calories: '400', access_token: access_token.token} }

      it { expect(response).to have_http_status(:ok) }
      it { expect(JSON.parse(response.body)['calories']).to be_between(234, 400) }
    end

    context 'random food by filter query [like tags]' do
      before { get :index, params: {like_tags: %w(ข้าว ต้ม), access_token: access_token.token} }

      it { expect(response).to have_http_status(:ok) }
      it { expect(JSON.parse(response.body)['tags']).to include('ข้าว', 'ต้ม') }
    end

    context 'random food by filter query [dislike tags]' do
      before { get :index, params: {dislike_tags: %w(ข้าว ต้ม), access_token: access_token.token} }

      it { expect(response).to have_http_status(:ok) }
      it { expect(JSON.parse(response.body)['tags']).not_to include('ข้าว', 'ต้ม') }
    end
  end
end
