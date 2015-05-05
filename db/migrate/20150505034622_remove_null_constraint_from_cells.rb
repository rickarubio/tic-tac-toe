class RemoveNullConstraintFromCells < ActiveRecord::Migration
  def change
    change_column :cells, :value, :string, null: true
  end
end
