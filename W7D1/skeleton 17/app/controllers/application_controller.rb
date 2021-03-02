class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?
  # skip_before_action :verify_authenticity_token

  def login_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def logout!
    current_user.reset_session_token! if logged_in?
    session[:session_token] = nil
    @current_user = nil
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def redirect_if_logged_in
    redirect_to cats_url if logged_in?
  end

  def require_user!
    redirect_to new_session_url if current_user.nil?
  end

  def require_no_user!
    redirect_to cats_url if current_user
  end
end
