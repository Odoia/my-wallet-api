class Wallet < ApplicationRecord
  has_one :users, class_name: '::User', inverse_of: :wallet

  validates :name, :description, :status,  presence: true
end
