require 'rails_helper'

feature 'Games', js:true do
  context 'Guest visits the homepage' do
    scenario 'sees a button to start a game' do
      start_game_message = 'Start a Game'

      visit root_path

      expect(page).to have_button(start_game_message)
    end
  end
end
