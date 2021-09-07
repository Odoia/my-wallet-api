class User < ApplicationRecord
  has_many :wallets, class_name: '::Wallet', inverse_of: :user

  validates :name, presence: true
end
