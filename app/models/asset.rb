class Asset < ApplicationRecord
  validates :code, :source, :segment, :company_name, :national_registry, :asset_type, presence: true

  enum asset_type: { real_state_fund: 0, action: 1, cryptocurrency: 2, exchange_traded_fund: 3 }
  enum source: { BR: 0, US: 1 }
end
