class RemoveNeighborIdFromProperty < ActiveRecord::Migration
  def change
    remove_column :properties, :neighbor_id, :integer
  end
end
