module Api
  module V1
    class UserController < ApplicationController
      before_action :user_params, only: [:create]

      def create
        result = create_user
        if result.id.nil?
          error_handler(errors: result.errors, status: 404)
        else
          render status: 201, json: { data: user_presenter(result), status: 201 }
        end
      end

      def show
        return error_handler if params[:id].blank?

        user = User.find_by(id: params['id'])

        if user.nil?
          error_handler(status: 404)
        else
          render status: 200, json: { data: user, status: 200 }
        end
      end

      private

      def user_params
        return error_handler if params[:user].blank?

        params.require(:user).permit(:name)
      end

      def error_handler(errors: nil, status: 400)
        render nothing: true, status: status, json: ErrorSerializer.call(errors: errors, status: status)
      end

      def create_user
        ::UserServices::Create.new(name: user_params['name']).call
      end

      def user_presenter(result)
        ::UserPresenter.new(result)
      end
    end
  end
end
