require 'rails_helper'

describe ::Wallet, type: :model do

  before do
    I18n.default_locale = :en
  end

  let(:user) { FactoryBot.create(:user) }

  context 'When create a valid user' do
    it 'should be return a created user' do

      valid_wallet = Wallet.new(
        name: Faker::Name.name,
        description: Faker::Lorem.characters(number: 10),
        status: 1,
        user_id: user.id
      )

      expect(valid_wallet).to be_valid
    end
  end

  context 'When create a new user user' do
    context 'When create a invalid user' do
      it 'should be return a error' do
        invalid_user = Wallet.new(name: nil)
        expect(invalid_user).not_to be_valid
      end
    end
  end
end
