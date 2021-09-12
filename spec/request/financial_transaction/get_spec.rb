require 'rails_helper'

describe '::Api::V1::FinancialTranactionController', type: :request do

  before do
    I18n.default_locale = :en
  end

  let(:body) { JSON.parse response.body }

  context '#GET' do
    context 'When showing a specific financial transaction' do
      context 'When use a valid id' do
        it 'must be return status 200' do
          financial_transaction = FactoryBot.create(:financial_transaction)
          get "/api/v1/financial_transactions/#{financial_transaction.id}", headers: { 'ACCEPT' => 'application/json' }
          expect(body['status']).to eq 200
          expect(body['data']['id']).to eq financial_transaction.id
        end
      end
    end

    context 'When use a invalid id' do
      it 'must be return status 404' do
        get '/api/v1/financial_transactions/1', headers: { 'ACCEPT' => 'application/json' }
        expect(body['status']).to eq 404
      end
    end
  end
end
