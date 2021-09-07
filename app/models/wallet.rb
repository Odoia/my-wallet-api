class Wallet < ApplicationRecord
  belongs_to :user, class_name: '::User'

  validates :name, :description, :status,  presence: true
end
