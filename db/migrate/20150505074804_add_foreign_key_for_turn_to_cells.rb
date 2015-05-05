class AddForeignKeyForTurnToCells < ActiveRecord::Migration
  def change
    add_reference :cells, :turn, index: true
  end
end
