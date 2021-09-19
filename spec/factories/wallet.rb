FactoryBot.define do
  factory :active_wallet, class: '::Wallet' do
    name { Faker::Color.color_name }
    description { Faker::Lorem.sentence }
    status { 1 }
    user { FactoryBot.create(:user) }
    distribution do
      {
        distribution: {
          action: {
            total: 0.5,
            sources: {
              BR: 0.5,
              US: 0.5
            }
          },
          exchange_traded_fund: {
            total: 0.5,
            sources: {
              BR: 0.7,
              US: 0.3
            }
          }
        }
      }
    end
  end

  factory :inactive_wallet, class: '::Wallet' do
    name { Faker::Color.color_name }
    description { Faker::Lorem.sentence }
    status { 0 }
    user { FactoryBot.create(:user) }
    distribution do
      {
        distribution: {
          action: {
            total: 0.5,
            sources: {
              BR: 0.5,
              US: 0.5
            }
          },
          exchange_traded_fund: {
            total: 0.5,
            sources: {
              BR: 0.7,
              US: 0.3
            }
          }
        }
      }
    end
  end
end
