class DashboardController < ApplicationController
  before_action :validate_user 
  
  def show 
    
  end

  private 

  def validate_user 
    redirect_to 'public/404.html' unless current_user
  end
  
end
