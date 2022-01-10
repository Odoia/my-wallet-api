module WalletServices
  class Delete
    def initialize(wallet)
      @wallet         = wallet
    end

    def call
      wallet_delete
    end

    private

    attr_reader :wallet

    def wallet_delete
      wallet.update(deleted_at: Time.now.utc)
    end
  end
end
