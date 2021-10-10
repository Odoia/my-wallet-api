FactoryBot.define do
  factory :asset, class: '::Asset' do
    code { "#{rand(0..100)}#{Faker::Alphanumeric.alphanumeric(number: 6)}"}
    description { 'description' }
    source { Asset.sources[:BR] }
    segment { 'segment' }
    company_name { 'company_name' }
    national_registry { 'national_registry' }
    asset_type { rand(0..3) }
  end

  factory :cryptocoin_asset, class: '::Asset' do
    crypto = Faker::CryptoCoin.coin_hash
    code { crypto[:acronym] } 
    description { crypto[:name] }
    source { Asset.sources[:US] }
    segment { 'Crypto Coin' }
    company_name { 'company_name_crypto' }
    national_registry { 'national_registry' }
    asset_type { 2 }
  end
end
