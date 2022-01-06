require 'rails_helper'

describe '::Api::V1::WalletController', type: :request do

  before do
    I18n.default_locale = :en
  end

  let(:body) { JSON.parse response.body }

  context 'When deleting a wallet' do
    context 'When showing a specific wallet' do
      context 'When use a valid id' do
        context 'When use a active wallet' do
          it 'must return status 200' do
            wallet = FactoryBot.create(:active_wallet)
            delete "/api/v1/wallet/#{wallet.id}", headers: { 'ACCEPT' => 'application/json' }
            expect(body['status']).to eq 200
          end
        end

        context 'When use a inactive wallet' do
          it 'must return status 404' do
            wallet = FactoryBot.create(:inactive_wallet)
            delete "/api/v1/wallet/#{wallet.id}", headers: { 'ACCEPT' => 'application/json' }
            expect(body['status']).to eq 404
          end
        end
      end
    end

    context 'When use a wallet that doesnt exists' do
        it 'must return status 404' do
            delete '/api/v1/wallet/1', headers: { 'ACCEPT' => 'application/json' }
            expect(body['status']).to eq 404
        end
    end
  end
end
