class Active < ApplicationRecord
  validates :code, :source, :segment, :company_name, :national_registry, :active_type, presence: true
end
