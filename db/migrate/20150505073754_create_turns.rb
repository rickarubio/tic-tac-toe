class CreateTurns < ActiveRecord::Migration
  def change
    create_table :turns do |t|
      t.belongs_to :game, index: true, null: false
      t.belongs_to :player, index: true, null: false
      t.timestamps
    end
  end
end
