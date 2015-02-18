class AddZoneIdToNeighbor < ActiveRecord::Migration
  def change
    add_column :neighbors, :zone_id, :integer
  end
end
