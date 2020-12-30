class Dashboard::ReposController < ApplicationController
  before_action :validate_user 

  def index 
    token = current_user.token 
    
    
    require 'pry'; binding.pry
  end
  
end
