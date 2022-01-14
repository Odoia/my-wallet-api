module Api
  module V1
    class FinancialTransactionController < ApplicationController
      include ErrorSerializer
      before_action :financial_transaction_params, only: [:create]

      def create
        result = create_financial_transaction
        if result.id.nil?
          error_handler(errors: result.errors, status: 404)
        else
          render status: 201, json: { data: result, status: 201 }
        end
      end

      def show
        return error_handler if params[:id].blank?

        financial_transaction = show_financial_transaction

        if financial_transaction.nil?
          error_handler(status: 404)
        else
          render status: 200, json: { data: show_financial_transaction, status: 200 }
        end
      end

      private

      def financial_transaction_params
        return error_handler if params[:financial_transaction].blank?

        params.require(:financial_transaction)
              .permit(:asset, :wallet, :financial_type, :quantity, :unit_value, :tax, :transaction_date)
      end

      def error_handler(errors: nil, status: 400)
        render nothing: true, status: status, json: ErrorSerializer.call(errors: errors, status: status)
      end

      def create_financial_transaction
        ::FinancialTransactionServices::Create.new(params: financial_transaction_params).call
      end

      def show_financial_transaction
        ::FinancialTransactionServices::ShowById.new(id: params[:id]).call
      end
    end
  end
end
