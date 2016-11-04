module Api
  module V1
    class TracksController < ApplicationController
      before_action :authenticate

      def index
        search = Sektor.search search_param

        result = params[:page].present? ? search.page(params[:page]) : search.all

        render json: result, status: :ok
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
