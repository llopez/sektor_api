module Api
  module V1
    class TracksController < ApplicationController
      before_action :authenticate

      def index
        result = Sektor.search search_param
        render json: result.data, status: :ok
      end

      rescue_from ActionController::ParameterMissing do |e|
        render json: { error: e }, status: :bad_request
      end

      private

      def search_param
        params.require :q
      end
    end
  end
end
