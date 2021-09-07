require 'rails_helper'

describe '::Api::V1::UserController', type: :request do

  before do
    I18n.default_locale = :en
  end

  let(:body) { JSON.parse response.body }

  context 'When showing a specific user' do
    context 'When use a valid id' do
      context 'When use a GET url' do
        it 'must be return status 201' do
          user = FactoryBot.create(:user)
          get "/api/v1/user/#{user.id}", headers: { 'ACCEPT' => 'application/json' }
          expect(body['status']).to eq 200
          expect(body['data']['name']).to eq user.name
        end
      end
    end

    context 'When use a invalid id' do
      context 'When use a body without user' do
        it 'must be return status 404' do
          get '/api/v1/user/1', headers: { 'ACCEPT' => 'application/json' }
          expect(body['status']).to eq 404
        end
      end
    end
  end
end
