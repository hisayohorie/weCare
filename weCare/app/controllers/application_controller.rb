class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # before_action :require_login
  protect_from_forgery with: :exception
  before_filter :assign_user
private

  def not_authenticated
   flash[:warning] = 'You have to authenticate to access this page.'
   redirect_to log_in_path
  end

  def assign_user
    @user ||= User.new
  end

end
