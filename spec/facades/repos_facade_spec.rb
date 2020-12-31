require 'rails_helper'

RSpec.describe 'Repos Facade' do 
  it 'can return repo objects for a repo', :vcr do 
    data = 
      {
        "provider"=>"github",
        "uid"=>"59512644",
        "info"=>
         {"nickname"=>"jdcarey128",
          "email"=>nil,
          "name"=>"Joshua Carey",
          "image"=>"https://avatars3.githubusercontent.com/u/59512644?v=4"},
        "credentials"=>{"token"=> ENV['USER_TOKEN'], "expires"=>false},
      }
    current_user = User.from_omniauth(data)

    repos = ReposFacade.get_repos(current_user, 'public')
    
    expect(repos).to be_a(Array)
    first = repos[0]
    expect(first.id).to be_a(Integer)
    expect(first.name).to be_a(String)
    expect(first.private).to be_a(FalseClass)
    expect(first.html_url).to be_a(String)
    expect(first.created_at).to be_a(String)
    expect(first.updated_at).to be_a(String)
  end
end
