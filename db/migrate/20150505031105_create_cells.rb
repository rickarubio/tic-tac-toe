class CreateCells < ActiveRecord::Migration
  def change
    create_table :cells do |t|
      t.string :value, null: false
      t.timestamps
    end
  end
end
