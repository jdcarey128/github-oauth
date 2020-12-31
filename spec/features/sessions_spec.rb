require 'rails_helper' 

RSpec.feature 'Sessions' do 
  it 'can create a session with login' do 
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      "provider" => 'github',
      "uid" => '123545',
      "info"=>{
        "nickname"=>"jdcarey128"
      },
      "credentials"=>{
        "token"=>ENV['USER_TOKEN'], "expires"=>false
      }
    })

    visit root_path 
    click_on 'Log In With GitHub'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content('Welcome jdcarey128')
  end
  
  it 'cannot create a session with invalid login' do 
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    })

    visit root_path 
    click_on 'Log In With GitHub' 
    save_and_open_page
    expect(page).to have_content("There was an error while trying to authenticate you...")

  end
end
