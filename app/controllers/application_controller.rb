class ApplicationController < ActionController::API
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # don't use protect from forgery because there are no cookies with an API
  # protect_from_forgery with: :exception
end
