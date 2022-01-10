module WalletServices
    class Update
      def initialize(wallet, params)
        @wallet       = wallet
        @name         = params[:name]
        @description  = params[:description]
        @status       = params[:status].to_i
      end
  
      def call
        wallet_update
      end
  
      private
  
      attr_reader :wallet, :name, :description, :status
  
      def wallet_update
        wallet.update(name: name, description: description, status: status)
        wallet
      end
    end
  end
  