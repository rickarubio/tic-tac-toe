require 'rails_helper'

feature 'Games', js:true do
  context 'Guest visits the homepage' do
    scenario 'sees a welcome message' do
      welcome_message = 'Welcome to the Games index page'

      visit root_path

      expect(page).to have_text(welcome_message)
    end
  end
end
