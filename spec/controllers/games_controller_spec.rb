require 'rails_helper'

describe GamesController do
  describe '#create' do
    describe 'game is saved successfully' do
      it 'renders show template' do
        player1 = build(:player)
        player2 = build(:player)

        post(
          :create,
          player1: { name: player1.name },
          player2: { name: player2.name }
        )

        expect(response).to redirect_to(assigns(:game))
      end
    end

    describe 'game is not saved successfully' do
      it 'renders new template' do
        allow_any_instance_of(Game).to receive(:save).and_return(false)
        player1 = build(:player)
        player2 = build(:player)

        post(
          :create,
          player1: { name: player1.name },
          player2: { name: player2.name }
        )

        expect(response).to render_template(:new)
      end
    end
  end

  describe '#show' do
    it 'finds game by id and renders template' do
      game = create(:game)

      get :show, id: game.id

      expect(response).to render_template(:show)
      expect(assigns(:game)).to eq(game)
    end
  end
end
