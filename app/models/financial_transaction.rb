class FinancialTransaction < ApplicationRecord
  belongs_to :wallet, class_name: '::Wallet'
  belongs_to :asset, class_name: '::Asset'
end
