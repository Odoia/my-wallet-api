require 'rails_helper'

describe ::FinancialTransaction, type: :model do

  before do
    I18n.default_locale = :en
  end

  let(:asset) { FactoryBot.create(:asset) }
  let(:wallet) { FactoryBot.create(:active_wallet) }

  let(:financial_transaction) do
    described_class.new(
      asset_id: asset.id,
      wallet_id: wallet.id,
      financial_type: type,
      quantity: 10,
      amount: 0.50,
      tax: 0,
      transaction_date: Date.today
    )
  end

  context 'When create a financial transaction' do
    context 'When pass a valid params' do
      let(:type) { 0 }
      it 'must return a valid sell financial transaction' do
        expect(financial_transaction).to be_valid
      end
    end

    context 'When pass a invalid params' do
      let(:type) {}
      it 'must return a invalid financial transaction' do
        expect(financial_transaction).not_to be_valid
      end
    end

    context 'When verify a financial transaction enum' do
      it 'must retur all financial types' do
        transaction_enum = { sell: 0, buy: 1}
        result = described_class.financial_types.symbolize_keys
        expect(result).to eq(transaction_enum)
      end
    end
  end
end
