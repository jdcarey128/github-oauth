require 'rails_helper' 

RSpec.feature 'Dashboard' do 
  describe 'as a logged in user, when I visit my dashboard' do 
    it 'I see buttons to my public and private repos' do 
      data = 
        {
          "provider"=>"github",
          "uid"=>"59512644",
          "info"=>
           {"nickname"=>"jdcarey128",
            "email"=>nil,
            "name"=>"Joshua Carey",
            "image"=>"https://avatars3.githubusercontent.com/u/59512644?v=4"},
          "credentials"=>{"token"=>"DATA", "expires"=>false},
        }
      @user = User.from_omniauth(data)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      
      visit dashboard_path
      
      expect(page).to have_content("Welcome #{@user.name}")
      expect(page).to have_button('My Public Repos')
      expect(page).to have_button('My Private Repos')
    end
  end

  describe 'as an unauthenticated user, if I visit a dashboard' do 
    it 'I am redirected to a 404' do 
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
  
      visit dashboard_path 
      expect(page).to have_content('The page you were looking for doesn\'t exist')
    end
  end
end