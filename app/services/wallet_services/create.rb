module WalletServices
  class Create
    def initialize(params:)
      @name         = params[:name]
      @description  = params[:description]
      @status       = params[:status]
      @user         = params[:user]
    end

    def call
      wallet_create
    end

    private

    attr_reader :name, :description, :status, :user

    def wallet_create
      ::Wallet.new.tap do |w|
        w.name = name
        w.description = description
        w.status = status
        w.user_id = user
        w.save
      end
    end
  end
end
