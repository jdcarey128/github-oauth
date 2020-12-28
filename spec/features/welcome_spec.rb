require 'rails_helper' 

RSpec.feature 'Welcome' do 
  describe 'When I visit the welcome page' do 
    it 'I see a button that allowx me to login via GitHub' do 
      visit root_path 

      within '.welcome' do 
        expect(page).to have_button('Log In With GitHub')
      end
    end
  end
end
