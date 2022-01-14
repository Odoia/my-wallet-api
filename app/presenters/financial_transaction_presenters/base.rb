module FinancialTransactionPresenters
  class Base
    attr_reader :id, :asset, :wallet, :financial_type, :quantity, :unit_value, :tax, :transaction_date

    def initialize(attrs)
      @id               = attrs[:id]
      @asset            = attrs[:asset_id]
      @wallet           = attrs[:wallet_id]
      @financial_type   = attrs[:financial_type]
      @quantity         = attrs[:quantity]
      @unit_value           = attrs[:unit_value]
      @tax              = attrs[:tax]
      @transaction_date = attrs[:transaction_date]
      @created_at       = attrs[:created_at]
    end
  end
end
