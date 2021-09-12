FactoryBot.define do
  factory :asset, class: '::Asset' do
    code { 'code' }
    description { 'description' }
    source { 'source' }
    segment { 'segment' }
    company_name { 'company_name' }
    national_registry { 'national_registry' }
    asset_type { 1 }
  end

  factory :cryptocoin_asset, class: '::Asset' do
    crypto = Faker::CryptoCoin.coin_hash
    code { crypto[:acronym] } 
    description { crypto[:name] }
    source { 'EUA' }
    segment { 'Crypto Coin' }
    company_name { 'company_name_crypto' }
    national_registry { 'national_registry' }
    asset_type { 2 }
  end
end
