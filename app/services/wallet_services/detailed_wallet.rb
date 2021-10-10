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
      wallet_keys_distribution = total_wallet_amount.first.wallet.distribution['distribution'].keys
      # require 'pry'; binding.pry

      result = {}
      total_wallet_amount.each do |a|
        next unless result[a.asset.code].nil?

        result[a.asset.code] = {
          source: a.asset.source,
          quantity: total_wallet_amount.where(asset_id: a.asset_id).count('quantity'),
          amount: total_wallet_amount.where(asset_id: a.asset_id).sum('amount').to_f,
          tax: total_wallet_amount.where(asset_id: a.asset_id).sum('tax').to_f,
          asset_type: a.asset.asset_type
        }
      end
      require 'pry'; binding.pry
      result
    end

    def wallet_keys_distribution
    end

    def total_wallet_amount
      total_wallet_amount ||= FinancialTransaction.joins(:wallet, :asset).where(wallet_id: id)
      total_wallet_amount
    end
  end
end
