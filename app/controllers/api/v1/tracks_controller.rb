module Api
  module V1
    class TracksController < ApplicationController
      def index
        token = token_param

        if token == Rails.application.secrets.api_token
          result = Sektor.search search_param
          render json: result, status: :ok
        else
          render json: { error: 'invalid token' }, status: :bad_request
        end
      end

      rescue_from ActionController::ParameterMissing do |e|
        render json: { error: e }, status: :bad_request
      end

      private

      def token_param
        params.require :token
      end

      def search_param
        params.require :q
      end
    end
  end
end
