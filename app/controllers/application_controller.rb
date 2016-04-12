class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_activity
    @current_activity ||= Activity.find(:id) if activity.id
  end

  def authorize
    if current_user.nil?
      redirect_to welcome_path, alert: 'Not authorized - you must be logged in!'
    end
  end
end
