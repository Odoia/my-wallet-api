require 'rails_helper'

describe ::Wallet, type: :model do

  before do
    I18n.default_locale = :en
  end

  let(:user) { FactoryBot.create(:user) }
  let(:wallet) do
    described_class.new(
      name: Faker::Name.name,
      description: Faker::Lorem.characters(number: 10),
      status: status,
      user_id: user.id
    )
  end

  context 'When use a valid params' do
    context 'When create a new wallet with a valid user' do
      let(:status) { 0 }
      it 'should be return a created a wallet with inactive status' do
        expect(wallet).to be_valid
      end
    end

    context 'When use a invalid params' do
      context 'When create a invalid user' do
        let(:status) {}
        it 'should be return a error' do
          expect(wallet).not_to be_valid
        end
      end

      context 'When verify a wallet status enum' do
        it 'must retur all wallet status' do
          enum = { inactive: 0, active: 1}
          result = described_class.statuses.symbolize_keys
          expect(result).to eq(enum)
        end
      end
    end
  end
end
