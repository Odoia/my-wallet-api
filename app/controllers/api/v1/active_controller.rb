module Api
  module V1
    class ActiveController < ApplicationController
      include ErrorSerializer
      before_action :active_params, only: [:create]

      def create
        result = create_active
        if result.id.nil?
          error_handler(errors: result.errors, status: 404)
        else
          render status: 201, json: { data: active_presenter(result), status: 201 }
        end
      end

      def show
        return error_handler if params[:id].blank?

        active = Active.find_by(id: params['id'])

        if active.nil?
          error_handler(status: 404)
        else
          render status: 200, json: { data: active, status: 200 }
        end
      end

      private

      def active_params
        return error_handler if params[:active].blank?

        params.require(:active)
              .permit(:code, :description, :source, :segment, :company_name, :national_registry, :active_type)
      end

      def error_handler(errors: nil, status: 400)
        render nothing: true, status: status, json: ErrorSerializer.call(errors: errors, status: status)
      end

      def create_active
        ::ActiveServices::Create.new(params: active_params).call
      end

      def active_presenter(result)
        ::ActivePresenter.new(result)
      end
    end
  end
end
