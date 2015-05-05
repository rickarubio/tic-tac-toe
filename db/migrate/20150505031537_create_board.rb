class CreateBoard < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.belongs_to :game, index: true
      t.timestamps
    end
  end
end
