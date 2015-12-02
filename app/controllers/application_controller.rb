class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  after_action :verify_authorized, except: [:index, :show]


  private

  def authenticate
    current_user.nil?
  end

  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user


  def user_not_authorized
    flash[:alert] = 'У вас нет прав на данное действие'
    redirect_to login_path
    # redirect_to(request.referrer || root_path)
  end
end
