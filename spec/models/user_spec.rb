require 'rails_helper'

describe ::User, type: :model do

  before do
    I18n.default_locale = :en
  end

  context 'When create a valid user' do
    it 'should be return a created user' do
      name = Faker::Name.name
      valid_user = User.new(name: name)

      expect(valid_user).to be_valid
    end
  end

  context 'When create a new user user' do
    context 'When create a invalid user' do
      it 'should be return a error' do
        invalid_user = User.new(name: nil)
        expect(invalid_user).not_to be_valid
      end
    end
  end
end
