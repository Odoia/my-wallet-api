class Asset < ApplicationRecord
  validates :code, :source, :segment, :company_name, :national_registry, :asset_type, presence: true
end
