class Game < ActiveRecord::Base
  has_many :players
  has_one :board

  def apply_rules
    top_row = [1,2,3]
    middle_row = [4,5,6]
    bottom_row = [7,8,9]
    top_column = [1,4,7]
    middle_column = [2,5,8]
    bottom_column = [3,6,9]
    diagnol_slash = [3, 5, 7]
    diagnol_backslash = [1,5,9]

    win_conditions = [
      top_row,
      middle_row,
      bottom_row,
      top_column,
      middle_column,
      bottom_column,
      diagnol_slash,
      diagnol_backslash
    ]

    cells = self.board.cells.order(:board_position)
    winner;

    win_conditions.each do |rule|
      player1_symbol = 'X'
      player2_symbol = 'O'
      points = { player1: 0, player2: 0 }
      rule.each do |board_position|
        cell = cells.find_by_board_position(board_position)
        if cell.value == player1_symbol
          points[:player1] = points[:player1] + 1
        elsif cell.value == player2_symbol
          points[:player2] = points[:player2] + 1
        end
      end

      if points[:player1] == 3
        winner = :player1
      elsif points[:player2] == 3
        winner = :player2
      end
    end

    if winner
      return winner
    else
      return :tie
    end
  end
end
