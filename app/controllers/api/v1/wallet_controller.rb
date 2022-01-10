module Api
  module V1
    class WalletController < ApplicationController
      include ErrorSerializer
      before_action :validate_if_params_exists, only: [:create, :update]
      before_action :wallet_create_params, only: [:create]
      before_action :wallet_update_params, only: [:update]

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

        wallet = Wallet.find_active_wallet_by(params[:id])

        if wallet.nil?
          error_handler(status: 404)
        else
          render status: 200, json: { data: wallet, status: 200 }
        end
      end

      def update
        return error_handler if params[:id].blank?
        wallet = Wallet.find_active_wallet_by(params[:id])
        
        if wallet.nil?
          error_handler(status: 404)
        else
          result = update_wallet(wallet)
          render status: 200, json: { data: wallet_presenter(result), status: 200 }
        end

      end

      def delete
        return error_handler if params[:id].blank?

        wallet = Wallet.find_inactive_wallet_by(params['id'])
        
        if wallet.nil?
          error_handler(status:404)
        else
          delete_wallet(wallet)
          render status: 200
        end
      end

      private

      def validate_if_params_exists
        error_handler if params[:wallet].blank?
      end

      def wallet_create_params
        params.require(:wallet).permit(:name, :description, :status, :user)
      end

      def wallet_update_params
        params.require(:wallet).permit(:name, :description, :status)
      end

      def error_handler(errors: nil, status: 400)
        render nothing: true, status: status, json: ErrorSerializer.call(errors: errors, status: status)
      end

      def create_wallet
        ::WalletServices::Create.new(params: wallet_create_params).call
      end

      def update_wallet(wallet)
        ::WalletServices::Update.new(wallet, wallet_update_params).call
      end

      def delete_wallet(wallet)
        ::WalletServices::Delete.new(wallet).call
      end

      def wallet_presenter(result)
        ::WalletPresenter.new(result)
      end
    end
  end
end
