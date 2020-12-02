class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def check_guest
    email = resource&.email || params[:user][:email].downcase
    redirect_to root_path, alert: 'ゲストユーザーの変更・削除はできません。' if email == 'guest@example.com'
  end
end
