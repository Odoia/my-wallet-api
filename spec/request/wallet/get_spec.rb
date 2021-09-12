require 'rails_helper'

describe '::Api::V1::WalletController', type: :request do

  before do
    I18n.default_locale = :en
  end

  let(:body) { JSON.parse response.body }

  context '#GET' do
    context 'When showing a specific wallet' do
      context 'When use a valid id' do
        context 'When use a active wallet' do
          it 'must be return status 200' do
            wallet = FactoryBot.create(:active_wallet)
            get "/api/v1/wallet/#{wallet.id}", headers: { 'ACCEPT' => 'application/json' }
            expect(body['status']).to eq 200
            expect(body['data']['name']).to eq wallet.name
          end
        end

        context 'When use a inactive wallet' do
          it 'must be return status 404' do
            wallet = FactoryBot.create(:inactive_wallet)
            get "/api/v1/wallet/#{wallet.id}", headers: { 'ACCEPT' => 'application/json' }
            expect(body['status']).to eq 404
          end
        end
      end
    end

    context 'When use a invalid id' do
      context 'When use a body without user' do
        it 'must be return status 404' do
          get '/api/v1/wallet/1', headers: { 'ACCEPT' => 'application/json' }
          expect(body['status']).to eq 404
        end
      end
    end
  end
end
