module Api
  module V1
    class AssetController < ApplicationController
      before_action :asset_params, only: [:create]

      def create
        result = create_asset
        if result.id.nil?
          error_handler(errors: result.errors, status: 404)
        else
          render status: 201, json: { data: asset_presenter(result), status: 201 }
        end
      end

      def show
        return error_handler if params[:id].blank?

        asset = Asset.find_by(id: params['id'])

        if asset.nil?
          error_handler(status: 404)
        else
          render status: 200, json: { data: asset, status: 200 }
        end
      end

      private

      def asset_params
        return error_handler if params[:asset].blank?

        params.require(:asset)
              .permit(:code, :description, :source, :segment, :company_name, :national_registry, :asset_type)
      end

      def error_handler(errors: nil, status: 400)
        render nothing: true, status: status, json: ErrorSerializer.call(errors: errors, status: status)
      end

      def create_asset
        ::AssetServices::Create.new(params: asset_params).call
      end

      def asset_presenter(result)
        ::AssetPresenter.new(result)
      end
    end
  end
end
