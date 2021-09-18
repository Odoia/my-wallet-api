module FinancialTransactionPresenters
  class ShowById
    attr_reader :asset, :wallet, :financial_type, :quantity, :amount, :tax, :transaction_date

    def initialize(attrs)
      @id               = attrs[:id]
      @asset            = asset_data(attrs.asset)
      @wallet           = wallet_data(attrs.wallet)
      @financial_type   = attrs[:financial_type]
      @quantity         = attrs[:quantity]
      @amount           = attrs[:amount]
      @tax              = attrs[:tax]
      @transaction_date = attrs[:transaction_date].to_date.to_s
      @created_at       = attrs[:created_at]
    end

    private

    def wallet_data(wallet)
      result = wallet.to_json(only: %i[id name description status])
      JSON.parse(result)
    end

    def asset_data(asset)
      result = asset.to_json(only: %i[id code description])
      JSON.parse(result)
    end
  end
end
