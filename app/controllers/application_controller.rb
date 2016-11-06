class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # don't use protect from forgery because there are no cookies with an API
  # protect_from_forgery with: :exception
  def token
    authenticate_with_http_basic do |email, password|
      user = User.authenticate(email, password)
      if user
        render json: { token: user.auth_token }
      else
        render json: { error: 'Incorrect credentials' }, status: 401
      end
    end
  end

  before_filter :authenticate_user_from_token, except: [:token]

  def authenticate_user_from_token
    unless authenticate_with_http_token { |token, options| User.find_by(auth_token: token) }
      render json: { error: 'Bad Token', status: 401 }
    end
end
