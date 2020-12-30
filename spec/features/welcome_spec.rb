require 'rails_helper' 

RSpec.feature 'Welcome' do 
  describe 'When I visit the welcome page' do 
    it 'I see a button that allowx me to login via GitHub' do 
      visit root_path 

      within '.welcome' do 
        expect(page).to have_button('Log In With GitHub')
      end 
    end

    it 'when I authorize with GitHub, I am taken to my user dashboard' do 
      data = {
        "provider"=>"github",
        "uid"=>"59512644",
        "info"=>
         {"nickname"=>"jdcarey128",
          "email"=>nil,
          "name"=>"Joshua Carey",
          "image"=>"https://avatars3.githubusercontent.com/u/59512644?v=4",
          "urls"=>{"GitHub"=>"https://github.com/jdcarey128", "Blog"=>""}},
        "credentials"=>{"token"=>"DATA", "expires"=>false},
        }
      # allow_any_instance_of(ApplicationController).to receive(:from_omniauth).and_return(data)

      visit root_path 
      click_on 'Log In With GitHub' 

      save_and_open_page
      
    end
  end
end
