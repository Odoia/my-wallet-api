class Wallet < ApplicationRecord
  belongs_to :user, class_name: '::User'
  has_many :financial_transaction, class_name: '::FinancialTransaction', inverse_of: :wallet

  validates :name, :description, :status,  presence: true

  enum status: { inactive: 0, active: 1 }

  def self.find_active_wallet_by_id(id)
    find_by(id: id, status: 1, deleted_at: nil)
  end

  def self.find_inactive_wallet_by_id(id)
    find_by(id: id, status: 0, deleted_at: nil)
  end
end
