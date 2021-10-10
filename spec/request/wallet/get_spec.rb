require 'rails_helper'

describe '::Api::V1::WalletController', type: :request do

  before do
    I18n.default_locale = :en
  end

  let(:body) { JSON.parse(response.body) }

  context '#GET' do
    context 'When showing a specific wallet' do
      context 'When use a valid id' do
        context 'When use a active wallet' do
          it 'must be return status 200' do
            wallet = FactoryBot.create(:active_wallet)
            get "/api/v1/wallets/#{wallet.id}", headers: { 'ACCEPT' => 'application/json' }
            expect(body['status']).to eq 200
            expect(body['data']['name']).to eq wallet.name
          end
        end

        context 'When use a inactive wallet' do
          it 'must be return status 404' do
            wallet = FactoryBot.create(:inactive_wallet)
            get "/api/v1/wallets/#{wallet.id}", headers: { 'ACCEPT' => 'application/json' }
            expect(body['status']).to eq 404
          end
        end
      end
    end

    context 'When use a invalid id' do
      context 'When use a body without user' do
        it 'must be return status 404' do
          get '/api/v1/wallets/1', headers: { 'ACCEPT' => 'application/json' }
          expect(body['status']).to eq 404
        end
      end
    end

    context 'When showing a wallet detail' do
      it 'mut return an details' do
        wallet = FactoryBot.create(:active_wallet)
        asset = FactoryBot.create(:asset, code: 'ivvb11', source: Asset.sources[:US])
        asset2 = FactoryBot.create(:asset, code: 'bova11', source: Asset.sources[:BR])
        FactoryBot.create(:financial_transaction, wallet: wallet)
        FactoryBot.create(:financial_transaction, wallet: wallet)
        FactoryBot.create(:financial_transaction, wallet: wallet)
        FactoryBot.create(:financial_transaction, wallet: wallet)
        FactoryBot.create(:financial_transaction, wallet: wallet)
        FactoryBot.create(:financial_transaction, wallet: wallet)
        FactoryBot.create(:financial_transaction, wallet: wallet, asset: asset2)
        FactoryBot.create(:financial_transaction, wallet: wallet, asset: asset)
        FactoryBot.create(:financial_transaction, wallet: wallet, asset: asset)
        FactoryBot.create(:financial_transaction, wallet: wallet, asset: asset)
        get "/api/v1/wallets/#{wallet.id}/details", headers: { 'ACCEPT' => 'application/json' }
require 'pry'; binding.pry
          expect(body['status']).to eq 404
      end
    end
  end
end
