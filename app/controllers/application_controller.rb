class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # don't use protect from forgery because there are no cookies with an API
  # protect_from_forgery with: :exception

  before_filter :authenticate_user_from_token

  def authenticate_user_from_token

    #To fix the issue about the commented code below, now the system manually checks for "AuthorizationToken in the header."
    auth_header = request.headers['AuthorizationToken'].to_s
    user = User.find_by(auth_token:auth_header)
    if user == nil
      render json: { error: 'Bad Token', status: 401 }
    end

    #The code below did not work, and we could not figure out how to name the header
    # unless authenticate_with_http_token { |token, options| User.find_by(auth_token: token) }
    #   render json: { error: 'Bad Token', status: 401 }
    # end
  end
end
