class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception #意図してない、ユーザからのリクエストをブロックする

  #:authenticate_user!は、ユーザがログインしていない場合はログインページにリダイレクトさせる
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
