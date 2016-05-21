require 'rails_helper'

RSpec.describe Api::V1::HistoriesController, type: :controller do
  let(:application) { FactoryGirl.create(:origin_application) }
  let(:user) { FactoryGirl.create(:user) }
  let(:access_token) { FactoryGirl.create(:access_token, application: application, resource_owner_id: user.id) }
  let!(:foods) { (0..6).map { FactoryGirl.create(:food) } }
  let!(:histories) { (0..6).map { FactoryGirl.create(:history, user: user, food: foods.sample) } }

  before { request.accept = 'application/json' }

  describe 'GET #index' do
    context 'when histories exists' do
      before { get :index, params: {access_token: access_token.token} }

      it { expect(response).to have_http_status(:ok) }
      it { expect(JSON.parse(response.body)['histories'].count).to eq histories.size }
    end
  end

  describe 'GET #show' do
    context 'when history exists' do
      let(:sample_history) { histories.sample }
      before { get :show, params: {id: sample_history.id, access_token: access_token.token} }

      it { expect(response).to have_http_status(:ok) }
      it { expect(JSON.parse(response.body)['history']['user']['email']).to eq sample_history.user.email }
      it { expect(JSON.parse(response.body)['history']['food']['name']).to eq sample_history.food.name }
    end

    context 'when history not exists' do
      before { get :show, params: {id: 'invalid', access_token: access_token.token} }

      it { expect(response).to have_http_status(:not_found) }
      it { expect(JSON.parse(response.body)).to have_key('message') }
      it { expect(JSON.parse(response.body)['message']).to eq I18n.t('activerecord.exception.not_found') }
    end
  end

  describe 'POST #create' do
    let(:sample_food) { foods.sample }
    let(:valid_history) { FactoryGirl.attributes_for(:history, food_id: sample_food.id) }
    let(:invalid_history) { FactoryGirl.attributes_for(:history, food_id: '') }

    context 'when all params is valid' do
      before { post :create, params: {history: valid_history, access_token: access_token.token} }

      it { expect(response).to have_http_status(:created) }
      it { expect(JSON.parse(response.body)['history']['user']['email']).to eq user.email }
      it { expect(JSON.parse(response.body)['history']['food']['name']).to eq sample_food.name }
    end

    context 'when params is invalid' do
      before { post :create, params: {history: invalid_history, access_token: access_token.token} }

      it { expect(response).to have_http_status(:unprocessable_entity) }
      it { expect(JSON.parse(response.body)).to have_key('errors') }
      it { expect(JSON.parse(response.body)['errors'][0]).to match(/can't.*blank/i) }
    end
  end

  describe 'DELETE #destroy' do
    let(:sample_history) { histories.sample }

    context 'delete history successfully' do
      before { delete :destroy, params: {id: sample_history.id, access_token: access_token.token} }

      it { expect(response).to have_http_status(:no_content) }
    end
  end
end
