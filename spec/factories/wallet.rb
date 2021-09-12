FactoryBot.define do
  factory :active_wallet, class: '::Wallet' do
    name { Faker::Color.color_name }
    description { Faker::Lorem.sentence }
    status { 1 }
    user { FactoryBot.create(:user) }
  end

  factory :inactive_wallet, class: '::Wallet' do
    name { Faker::Color.color_name }
    description { Faker::Lorem.sentence }
    status { 0 }
    user { FactoryBot.create(:user) }
  end
end
