require 'rails_helper'

describe '::Api::V1::WalletController', type: :request do

  before do
    I18n.default_locale = :en
    post '/api/v1/wallet', params: params, headers: { 'ACCEPT' => 'application/json' }
  end

  let(:body) { JSON.parse response.body }
  let(:user) { FactoryBot.create(:user) }

  context 'When create a wallet' do
    context 'When use a valid params' do
      context 'When use a POST url' do

        let(:params) do
          {
            'wallet': {
              'name': 'wallet name',
              'description': 'wallet description',
              'status': 1,
              'user': user.id
            }
          }
        end

        it 'must be return status 201' do
          expect(body['status']).to eq 201
        end

        it 'must be return wallet name' do
          expect(body['data']['name']).to eq 'wallet name'
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
        let(:params) { { 'wallet': {} } }

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
