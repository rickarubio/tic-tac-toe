class Board < ActiveRecord::Base
  BOARD_POSITIONS = [1,2,3,4,5,6,7,8,9]

  belongs_to :game
  has_many :cells

  def self.valid_board_positions
    BOARD_POSITIONS
  end
end
