class Dashboard::RepoService 

  
  def self.get_repos(current_user, type)
    response = Faraday.get('https://api.github.com/user/repos') do |req|
      req.headers['Authorization'] = "token #{current_user.token}"
      req.params['type'] = type
    end
    JSON.parse(response.body, symbolize_names: true)
  end

end
