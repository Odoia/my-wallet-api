class FinancialTransactionPresenter
  attr_reader :active, :wallet, :financial_type, :quantity, :amount, :tax, :transaction_date

  def initialize(attrs)
    @id               = attrs[:id]
    @active           = attrs[:active]
    @wallet           = attrs[:wallet]
    @financial_type   = attrs[:financial_type]
    @quantity         = attrs[:quantity]
    @amount           = attrs[:amount]
    @tax              = attrs[:tax]
    @transaction_date = attrs[:transaction_date]
    @created_at       = attrs[:created_at]
  end
end
