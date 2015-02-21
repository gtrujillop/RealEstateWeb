class AddNeighborIdToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :neighbor_id, :integer
  end
end
