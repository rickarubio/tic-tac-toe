require 'rails_helper'

feature 'Games', js:true do
  context 'Guest visits the homepage' do
    scenario 'sees a button to start a game' do
      start_game_message = 'Start a Game'

      visit root_path

      expect(page).to have_button(start_game_message)
    end

    context 'fills out form and starts a game' do
      scenario 'sees player names displayed' do
        visit root_path

        page.fill_in 'player1_name', with: 'Foo'
        page.fill_in 'player2_name', with: 'Bar'
        page.find_button('Start a Game').click

        expect(page.find('.player1-name')).to have_text('Player1 is Foo')
        expect(page.find('.player2-name')).to have_text('Player2 is Bar')
      end
    end
  end
end
