class Wallet < ApplicationRecord
  belongs_to :user, class_name: '::User'
  has_many :financial_transaction, class_name: '::FinancialTransaction', inverse_of: :wallet

  validates :name, :description, :status,  presence: true
end
