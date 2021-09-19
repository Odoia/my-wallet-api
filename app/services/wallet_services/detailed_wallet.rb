module WalletServices
  class DetailedWallet
    def initialize(id:)
      @id = id
    end

    def call
      wallet_details
    end

    private

    attr_reader :id

    def wallet_details
      total_wallet_amount = FinancialTransaction.select(:amount, :quantity).where(wallet_id: id).sum('amount * quantity')
    end
  end
end
