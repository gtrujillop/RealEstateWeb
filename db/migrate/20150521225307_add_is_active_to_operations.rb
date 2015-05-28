class AddIsActiveToOperations < ActiveRecord::Migration
  def change
    add_column :operations, :is_active, :boolean
  end
end
