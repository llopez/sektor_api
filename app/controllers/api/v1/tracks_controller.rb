module Api
  module V1
    class TracksController < ApplicationController
      def index
        begin
          result = Sektor.search search_params
          render json: result, status: :ok
        rescue ActionController::ParameterMissing => e
          render json: {error: e}, status: :bad_request
        end
      end

      private
      
      def search_params
        params.require(:q)
      end
    end
  end
end
