class AddLeaseHolderIdToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :lease_holder_id, :integer
  end
end
