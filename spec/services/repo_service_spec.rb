require 'rails_helper' 

RSpec.describe 'Repo Service' do 
  before :each do 
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
    @current_user = User.from_omniauth(data)
  end

  it 'can return json for a public repo', :vcr do 
    repos = RepoService.get_repos(@current_user, 'public')

    expect(repos).to be_a(Array)
    
    first = repos[0]
    expect(first).to have_key(:id)
    expect(first[:id]).to be_a(Integer)
    
    expect(first).to have_key(:name)
    expect(first[:name]).to be_a(String)

    expect(first).to have_key(:html_url)
    expect(first[:html_url]).to be_a(String)

    expect(first).to have_key(:created_at)
    expect(first[:created_at]).to be_a(String)

    expect(first).to have_key(:updated_at)
    expect(first[:updated_at]).to be_a(String)

    expect(first[:private]).to eq(false)
  end

  it 'can return json for a private repo', :vcr do 
    repos = RepoService.get_repos(@current_user, 'private')

    expect(repos).to be_a(Array)
    
    first = repos[0]
    expect(first).to have_key(:id)
    expect(first[:id]).to be_a(Integer)
    
    expect(first).to have_key(:name)
    expect(first[:name]).to be_a(String)

    expect(first).to have_key(:html_url)
    expect(first[:html_url]).to be_a(String)

    expect(first).to have_key(:created_at)
    expect(first[:created_at]).to be_a(String)

    expect(first).to have_key(:updated_at)
    expect(first[:updated_at]).to be_a(String)

    expect(first[:private]).to eq(true)
  end
end
