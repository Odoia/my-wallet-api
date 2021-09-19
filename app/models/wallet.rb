class Wallet < ApplicationRecord
  belongs_to :user, class_name: '::User'
  has_many :financial_transaction, class_name: '::FinancialTransaction', inverse_of: :wallet

  validates :name, :description, :status, :distribution, presence: true

  enum status: { inactive: 0, active: 1 }
end
