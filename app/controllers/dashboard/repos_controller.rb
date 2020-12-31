class Dashboard::ReposController < ApplicationController
  before_action :validate_user 

  def index 
    @type = params[:type]
    @repos = ::ReposFacade.get_repos(current_user, @type)
  end
  
end
