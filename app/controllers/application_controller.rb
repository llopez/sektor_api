class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  private

  def authenticate_token
    authenticate_with_http_token do |token, options|
      token == Rails.application.secrets.api_token
    end
  end

  def authenticate
    authenticate_token || render_unauthorized
  end

  def render_unauthorized
    head :unauthorized
  end

end
