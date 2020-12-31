class SessionsController < ApplicationController
  def create 
    begin
      @user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = @user.id 
      flash[:success] = "Welcome, #{@user.name}"
      redirect_to dashboard_path
    rescue 
      flash[:warning] = "There was an error while trying to authenticate you..."
      redirect_to root_path
    end
  end
end
