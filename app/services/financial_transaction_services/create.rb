module FinancialTransactionServices
  class Create
    def initialize(params:)
      @asset            = params[:asset]
      @wallet           = params[:wallet]
      @financial_type   = params[:financial_type].to_i
      @quantity         = params[:quantity]
      @unit_value           = params[:unit_value]
      @tax              = params[:tax]
      @transaction_date = params[:transaction_date]
    end

    def call
      base_presenter(financial_transaction_create)
    end

    private

    attr_reader :asset, :wallet, :financial_type, :quantity, :unit_value, :tax, :transaction_date

    def financial_transaction_create
      ::FinancialTransaction.new.tap do |ft|
        ft.asset_id = asset
        ft.wallet_id = wallet
        ft.financial_type = financial_type
        ft.quantity = quantity
        ft.unit_value = unit_value
        ft.tax = tax
        ft.transaction_date = transaction_date
        ft.save
      end
    end

    def base_presenter(result)
      ::FinancialTransactionPresenters::Base.new(result)
    end
  end
end
