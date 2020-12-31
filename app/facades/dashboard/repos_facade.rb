class Dashboard::ReposFacade 

  
  def self.get_repos(current_user, type)
    json = RepoService.get_repos(current_user, type)
    make_repos(json)
  end

  private 

  def self.make_repos(json)
    json.map do |repo|
      ::Repo.new(repo)
    end
  end
end
