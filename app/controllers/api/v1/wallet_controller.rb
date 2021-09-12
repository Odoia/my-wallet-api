module Api
  module V1
    class WalletController < ApplicationController
      include ErrorSerializer
      before_action :wallet_params, only: [:create]

      def create
        result = create_wallet
        if result.id.nil?
          error_handler(errors: result.errors, status: 404)
        else
          render status: 201, json: { data: wallet_presenter(result), status: 201 }
        end
      end

      def show

        return error_handler if params[:id].blank?

        wallet = Wallet.find_by(id: params['id'], status: 1)

        if wallet.nil?
          error_handler(status: 404)
        else
          render status: 200, json: { data: wallet, status: 200 }
        end
      end

      private

      def wallet_params
        return error_handler if params[:wallet].blank?

        params.require(:wallet).permit(:name, :description, :status, :user)
      end

      def error_handler(errors: nil, status: 400)
        render nothing: true, status: status, json: ErrorSerializer.call(errors: errors, status: status)
      end

      def create_wallet
        ::WalletServices::Create.new(params: wallet_params).call
      end

      def wallet_presenter(result)
        ::WalletPresenter.new(result)
      end
    end
  end
end
