class AddIndexToCells < ActiveRecord::Migration
  def change
    change_table :cells do |t|
      t.belongs_to :board, index: true
    end
  end
end
