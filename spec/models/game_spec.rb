require 'rails_helper'

describe Game do
  describe 'timestamps' do
    it 'are not nil after creation' do
      game = create(:game)

      expect(game.updated_at).not_to eq(nil)
      expect(game.created_at).not_to eq(nil)
    end
  end
end
