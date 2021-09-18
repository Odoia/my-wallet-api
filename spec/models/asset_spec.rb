require 'rails_helper'

describe ::Asset, type: :model do

  before do
    I18n.default_locale = :en
  end

  let(:type) { 0 }
  let(:asset) do
    described_class.new(
      code: 'code',
      description: 'description',
      source: 'source',
      segment: 'segment',
      company_name: 'company_name',
      national_registry: 'national_registry',
      asset_type: type
    )
  end

  context 'When create an asset' do
    context 'When pass a valid params' do
      it 'must return a valid asset' do
        expect(asset).to be_valid
      end
    end

    context 'When pass a invalid params' do
      let(:type) {}
      it 'must return a invalid financial transaction' do
        expect(asset).not_to be_valid
      end
    end

    context 'When verify a asset enum' do
      it 'must retur all asset enuns' do
        asset_enum = { real_state_fund: 0, action: 1, cryptocurrency: 2, exchange_traded_fund: 3 } 
        result = described_class.asset_types.symbolize_keys
        expect(result).to eq(asset_enum)
      end
    end
  end
end
