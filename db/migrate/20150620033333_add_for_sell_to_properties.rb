class AddForSellToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :for_sell, :boolean
  end
end
