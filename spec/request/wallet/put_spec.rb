require 'rails_helper'

describe '::Api::V1::WalletController', type: :request do

  before do
    I18n.default_locale = :en
    put "/api/v1/wallet/#{wallet.id}",  params: params, headers: { 'ACCEPT' => 'application/json' }
  end

  let(:body) { JSON.parse response.body }

  context 'When updating a wallet' do
    context 'When use a valid params' do
      context 'When the wallet is active' do
        let(:wallet) { FactoryBot.create(:active_wallet) }
        let(:params) do
          {
            'wallet': {
              'name': 'wallet updated',
              'description': 'new description'
            }
          }
        end
        

        it 'must return status 200' do
          expect(body['status']).to eq 200
        end

        it 'must return wallet name' do
          expect(body['data']['name']).to eq 'wallet updated'
        end
      end

      context 'When the wallet is inactive' do
        let(:wallet) { FactoryBot.create(:inactive_wallet) }
        let(:params) do
          {
            'wallet': {
              'name': 'wallet updated',
              'description': 'new description',
              'status': 1
            }
          }
        end

        it 'must return status 404' do
          expect(body['status']).to eq 404
        end
      end
    end

    context 'When use a invalid params' do
      let(:wallet) { FactoryBot.create(:active_wallet) }

      context 'When use a body without name' do
        let(:params) { { 'wallet': {} } }

        it 'must return status 400' do
          expect(body['status']).to eq 400
        end
      end

      context 'When try send a empty body' do
        let(:params) {}

        it 'must return status 400' do
          expect(body['status']).to eq 400
        end
      end
    end
  end
end
