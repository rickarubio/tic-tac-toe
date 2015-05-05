class AddBoardPositionToCell < ActiveRecord::Migration
  def change
    add_column :cells, :board_position, :integer
  end
end
