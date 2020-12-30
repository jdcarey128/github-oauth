class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def validate_user 
    redirect_to 'public/404.html' unless current_user
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end


end
