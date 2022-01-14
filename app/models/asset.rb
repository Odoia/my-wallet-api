class Asset < ApplicationRecord
  has_one :financial_transaction, class_name: '::FinancialTransaction'
  has_and_belongs_to_many :wallet, class_name: '::Wallet'
  
  validates :code, :source, :segment, :company_name, :national_registry, :asset_type, presence: true

  enum asset_type: { real_state_fund: 0, action: 1, cryptocurrency: 2, exchange_traded_fund: 3 }
end
