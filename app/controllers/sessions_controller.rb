class SessionsController < ApplicationController
  def create 
    begin
      @user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = @user.id 
      flas[:success] = "Welcome, #{@user.name}"
    rescue 
      flash[:warning] = "There was an error while trying to authenticate you..."
    end
    redirect_to dashboard_path
  end
end
