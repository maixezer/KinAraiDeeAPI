require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  let(:application) { FactoryGirl.create(:origin_application) }
  let(:user) { FactoryGirl.create(:user) }
  let(:users) { (0..2).map { FactoryGirl.create(:user) } }
  let(:access_token) { FactoryGirl.create(:access_token, application: application, resource_owner_id: user.id) }

  before { request.accept = 'application/json' }

  describe 'GET #show' do
    context 'get own information' do
      before { get :show, params: {id: 'me', access_token: access_token.token} }

      it { expect(response).to have_http_status(:ok) }
      it { expect(JSON.parse(response.body)['email']).to eq user.email }
    end

    context 'cannot access other user information' do
      before { get :show, params: {id: users.sample.id, access_token: access_token.token} }

      it { expect(response).to have_http_status(:unauthorized) }
      it { expect(JSON.parse(response.body)).to have_key('message') }
      it { expect(JSON.parse(response.body)['message']).to eq I18n.t('authroization.unauthorized') }
    end
  end
end