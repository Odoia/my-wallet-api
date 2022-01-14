require 'rails_helper'

describe '::Api::V1::FinancialTransactionController', type: :request do

  before do
    I18n.default_locale = :en
    post '/api/v1/financial_transactions', params: params, headers: { 'ACCEPT' => 'application/json' }
  end

  let(:body) { JSON.parse response.body }
  let(:asset) { FactoryBot.create(:cryptocoin_asset) }
  let(:wallet) { FactoryBot.create(:active_wallet) }

  context '#POST' do
    context 'When create a financial transaction' do
      context 'When use a valid params' do
        let(:params) do
          {
            'financial_transaction': {
              'asset': asset.id,
              'wallet': wallet.id,
              'financial_type': 1,
              'quantity': 10,
              'unit_value': 0.50,
              'tax': 0,
              'transaction_date': Date.today
            }
          }
        end

        it 'must be return status 201' do
          expect(body['status']).to eq 201
        end
      end
    end

    context 'When use a invalid params' do
      context 'When use a body without financial_transaction' do
        let(:params) do
          {
            'asset': asset.id,
            'wallet': wallet.id,
            'financial_type': 1,
            'quantity': 10,
            'unit_value': 0.50,
            'tax': 0,
            'transaction_date': Date.today
          }
        end

        it 'must be return status 400' do
          expect(body['status']).to eq 400
        end
      end

      context 'When use a body without asset' do
        let(:params) do
          {
            'financial_transaction': {
              'wallet': wallet.id,
              'financial_type': 1,
              'quantity': 10,
              'unit_value': 0.50,
              'tax': 0,
              'transaction_date': Date.today
            }
          }
        end

        it 'must be return correct status and error' do
          expect(body['errors'].first['id']).to eq 'asset'
          expect(body['errors'].first['title']).to eq 'must exist'
          expect(body['errors'].first['status']).to eq 404
        end
      end

      context 'When use a body without wallet' do
        let(:params) do
          {
            'financial_transaction': {
              'asset': asset.id,
              'financial_type': 1,
              'quantity': 10,
              'unit_value': 0.50,
              'tax': 0,
              'transaction_date': Date.today
            }
          }
        end

        it 'must be return correct status and error' do
          expect(body['errors'].first['id']).to eq 'wallet'
          expect(body['errors'].first['title']).to eq 'must exist'
          expect(body['errors'].first['status']).to eq 404
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
