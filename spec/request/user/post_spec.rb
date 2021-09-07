require 'rails_helper'

describe '::Api::V1::UserController', type: :request do

  before do
    I18n.default_locale = :en
    post '/api/v1/user', params: params, headers: { 'ACCEPT' => 'application/json' }
  end

  let(:body) { JSON.parse response.body }

  context 'When create a user' do
    context 'Whe use a valid params' do
      context 'When use a POST url' do
        let(:params) { { 'user': { 'name': 'user name' } } }

        it 'must be return status 201' do
          expect(body['status']).to eq 201
        end

        it 'must be return user name' do
          expect(body['data']['name']).to eq 'user name'
        end
      end
    end

    context 'When use a invalid params' do
      context 'When use a body without user' do
        let(:params) { { 'name': 'user name' } }

        it 'must be return status 400' do
          expect(body['status']).to eq 400
        end
      end

      context 'When use a body without name' do
        let(:params) { { 'user': {} } }

        it 'must be return status 400' do
          expect(body['status']).to eq 400
        end
      end

      context 'When try send a empty body' do
        let(:params) {}

        it 'must be return status 400' do
          expect(body['status']).to eq 400
        end
      end
    end
  end
end
