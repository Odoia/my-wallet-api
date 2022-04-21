class FinancialTransaction < ApplicationRecord
  belongs_to :wallet, class_name: '::Wallet'
  belongs_to :asset, class_name: '::Asset'

  validates :financial_type, :quantity, :unit_value, :tax, :transaction_date, presence: true

  enum financial_type: { sell: 0, buy: 1 }
end
